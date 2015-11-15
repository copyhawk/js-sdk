require "copy_hawk/version"
require "copy_hawk/hawk_api"

module CopyHawk

  def self.getEyas
    Eyas.new([])
  end

  class Eyas
    def initialize(args)
      @token          = ENV["COPYHAWK_SITE_TOKEN"]
      @key            = ENV["COPYHAWK_ACCOUNT_TOKEN"]
      @defaultLang    = ENV["COPYHAWK_DEFAULT_LANGUAGE"]
      @hawkApi        = HawkApi.new
    end

    def getPreviewCopy(label, lang=@defaultLang)
      #xhttp.open("GET", "//localhost:3000/api/p/staging." + @token + "/" + label + "?lang="+lang+"&cache="+cacheKey, true);
      #xhttp.setRequestHeader("Content-Type" => "text/plain");
      #xhttp.send();
      begin
        response = @hawkApi.getSingleStagingScript(@token, @key, label, lang)
        # HTTParty.get("https://www.google.com:3000/api/staging/#{@token}/#{label}?lang=#{lang}", headers: { 'Authorization' => @key, "Content-Type" => "text/html" })
        process_response(response, label, lang)
      rescue HTTParty::Error, Net::ReadTimeout, SocketError, JSON::ParserError, Errno::ECONNREFUSED => e
        # Return a blank for any errors - 404 should return a specific error to show script is missing for that label & language
        response = Object.new
        response.body = "[eyas-error: fetching label #{label} & lang #{lang}]"
      end
      response.body
    end

    def getSingleCopy(label, lang=@defaultLang)
      begin
        response = @hawkApi.getSingleLiveScript(@token, @key, label, lang)
        process_response(response, label, lang)
      rescue HTTParty::Error, Net::ReadTimeout, SocketError, JSON::ParserError, Errno::ECONNREFUSED => e
        # Return a blank for any errors - 404 should return a specific error to show script is missing for that label & language
        response = Object.new
        response.body = "[eyas-error: fetching label #{label} & lang #{lang}]"
      end
      response.body
    end

    def getMultiCopy(labels, lang=@defaultLang)
      begin
        response = @hawkApi.getMultiLiveScripts(@token, @key, labels, lang)
        process_response(response, labels, lang)
      rescue HTTParty::Error => e
        response = Object.new
        response.body = "[eyas-error: fetching multiple labels & lang #{lang}]"
      end
      response.body
    end

    # Private reusable logic
    private

    def process_response(response, label, lang)
      if (!(label.is_a? String))
        label = '[*]'
      end
      if response.code == 404
        response.body = "[eyas-error: missing label #{label} & lang #{lang}]"
      elsif response.code == 403
        response.body = "[eyas-error: not authorized for label #{label} & lang #{lang}]"
      elsif response.code == 500
        response.body = "[eyas-error: fetching label #{label} & lang #{lang}]"
      end
    end

  end # END CLASS
end

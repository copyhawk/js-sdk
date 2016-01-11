require 'httparty'

class HawkApi
  include HTTParty
  @@base_uri = "http://localhost:3000/api"

  def single_staging_script(token, label, lang)
    response = self.class.get("#{@@base_uri}/staging/#{token}/#{label}?lang=#{lang}",
                            headers: { "Content-Type" => "text/html" })
    response
  end

  def single_live_script(token, label, lang)
    response = self.class.get("#{@@base_uri}/#{token}/#{label}?lang=#{lang}",
                            headers: { "Content-Type" => "text/html" })
    response
  end

  def multi_live_scripts(token, labels, lang)
    # Create a hash to pass as params
    labels = {"labels" => labels}
    response = self.class.get("#{@@base_uri}/#{token}/?lang=#{lang}&#{URI.encode_www_form(labels)}",
                            headers: { "Content-Type" => "text/html" })
    response
  end

end

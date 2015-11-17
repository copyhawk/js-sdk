require 'httparty'

class HawkApi
  include HTTParty
  @@base_uri = "http://localhost:3000/api"

  def single_staging_script(token, key, label, lang)
    response = self.class.get("#{@@base_uri}/staging/#{token}/#{label}?lang=#{lang}",
                            headers: { 'Authorization' => key, "Content-Type" => "text/html" })
    response
  end

  def single_live_script(token, key, label, lang)
    response = self.class.get("#{@@base_uri}/#{token}/#{label}?lang=#{lang}",
                            headers: { 'Authorization' => key, "Content-Type" => "text/html" })
    response
  end

  def multi_live_scripts(token, key, labels, lang)
    # Create a hash to pass as params
    labels = {"labels" => labels}
    response = self.class.get("#{@@base_uri}/#{token}/?lang=#{lang}&#{URI.encode_www_form(labels)}",
                            headers: { 'Authorization' => key, "Content-Type" => "text/html" })
    response
  end

end

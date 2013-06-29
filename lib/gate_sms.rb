# encoding: utf-8
require 'faraday'
require 'custom_user_agent'

class GateSms

  def initialize
    @conn = Faraday.new(:url => 'http://www.gatesms.eu') do |faraday|
      faraday.request  :url_encoded             
      faraday.adapter  Faraday.default_adapter  
      faraday.headers["User-Agent"] = CustomUserAgent.get_user_agent
      faraday.headers["Cookie"]     = "hz_amChecked=1;gatesms_cook=1;"
    end
  end

  def process(number)
    number = number.gsub(/^48/, '')
    @conn.get("sprawdz_operatora")
    { number: number }.merge(process_response(@conn.get("sms_api.php", { spr_operator: number }).body))
  rescue
    raise PlOperatorDetector::ProcessingError, "Could not process given number"
  end

  private

  def process_response(response)
    raise PlOperatorDetector::ProcessingError, "Could not process given number" if response.match(/Chwilowe/)
    { provider: response }
  end

end
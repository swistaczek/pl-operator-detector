# encoding: utf-8
require 'faraday'
class PlOperatorDetector
  class TMobile 

    def initialize
      @conn = Faraday.new(:url => 'http://download.t-mobile.pl/updir/') do |faraday|
        faraday.request  :url_encoded             
        faraday.adapter  Faraday.default_adapter  
        faraday.headers["User-Agent"] = CustomUserAgent.get_user_agent
      end
    end

    def process(number)
      rsp   = @conn.get 'updir.cgi', { msisdn: number }
      { number: number }.merge process_response(rsp.body)
    end

    private

    def process_response(response)
      rslt = { }

      match_opcode = response.match(/<b>Kod sieci:<\/b><\/td><td>([\d\s]+)<\/td>/)
      rslt[:operator_code] = match_opcode[1] if match_opcode && match_opcode[1]

      match_opstr  = response.match(/<b>Operator:<\/b><\/td><td>(.{2,26})<\/td>/)
      if match_opstr && match_opstr[1]
        rslt[:operator] = match_opstr[1]
      else
        raise PlOperatorDetector::ProcessingError, "Could not process given number"
      end
      rslt
    end
  end
end
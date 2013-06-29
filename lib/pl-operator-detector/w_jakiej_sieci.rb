# encoding: utf-8
require 'faraday'
class PlOperatorDetector
  class WJakiejSieci

    def initialize
      @conn = Faraday.new(:url => 'http://www.wjakiejsieci.pl/') do |faraday|
        faraday.request  :url_encoded             
        faraday.adapter  Faraday.default_adapter  
        faraday.headers["User-Agent"] = CustomUserAgent.get_user_agent
      end
    end

    def process(number)
      prefix = number.size == 11 ? "+#{number[0..1]}" : "+48"
      pnumbr = number.size == 11 ? number[2..12] : number

      rsp   = @conn.post '/', { prefix: prefix, phone: pnumbr }
      { number: number }.merge process_response(rsp.body)
    end

    private

    def process_response(response)
      rslt = { }

      match_opstr  = response.match(/Operator: <strong>(.{2,20})<\/strong><\/p>/)
      if match_opstr && match_opstr[1]
        rslt[:operator] = match_opstr[1]
      else
        raise PlOperatorDetector::ProcessingError, "Could not process given number"
      end
      rslt
    end

  end
end
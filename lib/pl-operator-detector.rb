# encoding: utf-8
require 'faraday'
require 't_mobile'
require 'w_jakiej_sieci'
require 'gate_sms'

class PlOperatorDetector

  class ProcessingError < StandardError ; end

  def initialize
    @services = [ TMobile.new, WJakiejSieci.new, GateSms.new ]
  end

  def find(number)
    number = number.split.join.to_i.to_s
    number = "48" + number if number.size == 9

    raise ArgumentError, "Please specify 9 or 11 digit number (including country code, for example: 48501501501)" if number.to_s.size < 9 || number.to_s.size > 11
    raise ArgumentError, "Currently we support only polish numbers" if number.to_s.size == 11 && number[0..1] != "48"

    @services.each do |service|
      begin
        @rsp = service.process(number)
        break if @rsp
      rescue Faraday::Error::TimeoutError, ProcessingError => e
        next
      end
    end

    raise ProcessingError, "Could not process given number" unless @rsp
    @rsp
  end

end
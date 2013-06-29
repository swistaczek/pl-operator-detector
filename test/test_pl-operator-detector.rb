require 'helper'
require 'vcr'

class TestPlOperatorDetector < Test::Unit::TestCase
  should "identify P4 phone number" do
    VCR.use_cassette('test_play') do
      @detector = PlOperatorDetector.new
      assert_equal(@detector.find('790 777 777')[:operator], :play)
    end
  end

  should "identify TMobile (PTC) phone number" do
    VCR.use_cassette('test_tmobile') do
      @detector = PlOperatorDetector.new
      assert_equal(@detector.find('602 900 000')[:operator], :tmobile)
    end
  end
end

require 'helper'

class TestPlOperatorDetector < Test::Unit::TestCase
  should "identify P4 phone number" do
    @detector = PlOperatorDetector.new
    assert_equal(@detector.find('790 777 777')[:operator], :play)
  end

  should "identify TMobile (PTC) phone number" do
    @detector = PlOperatorDetector.new
    assert_equal(@detector.find('602 900 000')[:operator], :tmobile)
  end
end

# encoding: UTF-8
require File.dirname(__FILE__) + '/test_helper'
require 'time'

class SpeedParsing < Test::Unit::TestCase
  def setup
    @msg = TestHelper.load_hl7(:lotsunknowns)
  end

  def test_large_unknown_segments
    start = Time.now
    doc = HL7::Message.new @msg
    assert_not_nil doc
    ends = Time.now
    assert ((ends-start) < 1)
  end 
end                                               

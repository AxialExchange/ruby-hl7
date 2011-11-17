require File.dirname(__FILE__) + '/test_helper'
class ZedSegment < Test::Unit::TestCase

  def setup
    @base = "ZED|CARDIAC^Cardiac Symptoms||246315"
  end

  def test_initial_read
    zed = HL7::Message::Segment::ZED.new @base
    assert_equal( "CARDIAC^Cardiac Symptoms", zed.unknown1 )
    assert_equal( "", zed.unknown2 )
    assert_equal( "246315", zed.armband_id )
  end

end

require File.dirname(__FILE__) + '/test_helper'
class ZedSegment < Test::Unit::TestCase

  def setup
    @base = "ZED|CARDIAC^Cardiac Symptoms|4E-Pediatrics|246315"
  end

  def test_initial_read
    zed = HL7::Message::Segment::ZED.new @base
    assert_equal( "CARDIAC^Cardiac Symptoms", zed.chief_complaint )
    assert_equal( "4E-Pediatrics", zed.hospital_unit )
    assert_equal( "246315", zed.armband_id )
  end

end

# encoding: UTF-8
require File.dirname(__FILE__) + '/test_helper'

class ObxSegment < Test::Unit::TestCase
  def setup
    @base = "NK1|1|Maria Francis|F^F|201 Happy Lane^^Raleigh^NC^27608^^^^|(919)225-6562|(919)650-6325|E^Emergency Contact||||||Snoopys Hot Dogs||F||||||||||||||||||||||"
  end

  def test_read
    seg = HL7::Message::Segment::NK1.new @base
    
    assert_equal( "1", seg.set_id )
    assert_equal( "Maria Francis", seg.name )
    assert_equal( "F", seg.relationship["identifier"] )
    assert_equal( "F", seg.relationship["text"] )
    assert_equal( "201 Happy Lane", seg.address["street_address"] )
    assert_equal( "Raleigh", seg.address["city"] )
    assert_equal( "NC", seg.address["state_province"] )
    assert_equal( "27608", seg.address["zip_postal_code"] )
    assert_equal( "E", seg.contact_role["identifier"] )
    assert_equal( "Emergency Contact", seg.contact_role["text"] )
    assert_equal( "(919)225-6562", seg.phone_number )
    assert_equal( "(919)650-6325", seg.business_phone_number )
    assert_equal( "Snoopys Hot Dogs", seg.organization_name )
    assert_equal( "F", seg.sex )
  end

  def test_create
    seg = HL7::Message::Segment::NK1.new
    seg.name = "Sammy Adams"
    seg.phone_number = "(215)215-2152"
    seg.business_phone_number = "(215)512-5125"
    seg.address = "1 Broad Street^^Quakertown^PA^18951"
    seg.sex = "M"
    puts seg.inspect
    assert_equal( "1 Broad Street", seg.address["street_address"] )
    assert_equal( "Quakertown", seg.address["city"] )
    assert_equal( "PA", seg.address["state_province"] )
    assert_equal( "18951", seg.address["zip_postal_code"] )
    assert_equal( "M", seg.sex )
  end
end

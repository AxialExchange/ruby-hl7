# encoding: UTF-8
require File.dirname(__FILE__) + '/test_helper'

class Dg1Segment < Test::Unit::TestCase
  def setup
    # "id_number", "family_name", "given_name", "middle_name", "suffix", "prefix"
    @base = "DG1|1|I9|784.0^Headache (HA)^I9|||DIS||||||||||1234^Smith^Sarah^^^Dr|"

  end

  def test_read
    seg = HL7::Message::Segment::DG1.new @base

    assert_equal( "1", seg.set_id )
    assert_equal( "I9", seg.diagnosis_coding_method)
    assert_equal( "784.0", seg.diagnosis_code["identifier"] )
    assert_equal( "Headache (HA)", seg.diagnosis_code["text"] )
    assert_equal( "I9", seg.diagnosis_code["name_of_coding_system"] )
    assert_equal( "DIS", seg.diagnosis_type )
    assert_equal( "Smith", seg.diagnosing_clinician["family_name"] )
    assert_equal( "Sarah", seg.diagnosing_clinician["given_name"] )
  end

  def test_create
    seg = HL7::Message::Segment::NK1.new
    seg.name = "Sammy Adams"
    seg.phone_number = "(215)215-2152"
    seg.business_phone_number = "(215)512-5125"
    seg.address = "1 Broad Street^^Quakertown^PA^18951"
    seg.sex = "M"
    # puts seg.inspect
    assert_equal( "1 Broad Street", seg.address["street_address"] )
    assert_equal( "Quakertown", seg.address["city"] )
    assert_equal( "PA", seg.address["state_province"] )
    assert_equal( "18951", seg.address["zip_postal_code"] )
    assert_equal( "M", seg.sex )
  end
end

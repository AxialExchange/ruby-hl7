require File.dirname(__FILE__) + '/test_helper'

class BasicNameParsing < Test::Unit::TestCase
  def setup
    @simple_msh_txt = TestHelper.load_hl7(:pid_name)
  end

  def test_read
    msg = HL7::Message.new
    msg.parse @simple_msh_txt
    assert_equal(msg[:PID].patient_name["family_name"], "ENADTEST")
    assert_equal(msg[:PID].patient_name["given_name"], "INPATIENT")
    assert_equal(msg[:PID].patient_name["middle_name"], "JOHN")
    assert_equal(msg[:PV1].attending_doctor["given_name"], "ROBERT")
  end

  def test_write_msh
    msg = HL7::Message.new
    msg.parse @simple_msh_txt

    assert_equal({"trigger_event" => "A08", 
                  "message_type"  => "ADT"}, msg[:MSH].message_type)

    msg[:MSH].message_type = {"trigger_event" => "R01", 
                              "message_type"  => "ORU"}
    assert_equal({"trigger_event" => "R01", 
                  "message_type"  => "ORU"}, msg[:MSH].message_type)

    msg[:MSH].message_type = {:trigger_event => "R01", 
                              :message_type  => "ORU"}
    assert_equal({"trigger_event" => "R01", 
                  "message_type"  => "ORU"}, msg[:MSH].message_type)
  end

  def test_write_field_unchanged
    msg = HL7::Message.new
    msg.parse @simple_msh_txt
    assert_equal "ENADTEST^INPATIENT^JOHN", msg[:PID].elements[5]
    msg[:PID].patient_name = msg[:PID].patient_name
    assert_equal "ENADTEST^INPATIENT^JOHN", msg[:PID].elements[5]
  end

  def test_write_field_trims_trailing_empty_fields
    pid = HL7::Message::Segment::PID.new
    pid.patient_name = {:family_name => 'DOE', :given_name => 'JOHN', :middle_name => 'Q'}
    assert_equal "PID|||||DOE^JOHN^Q", pid.to_s
  end

  def test_write_field_preserves_trailing_whitespace_fields
    pid = HL7::Message::Segment::PID.new
    pid.patient_name = {:family_name => 'DOE', :given_name => 'JOHN', :middle_name => ' '}
    assert_equal "PID|||||DOE^JOHN^ ", pid.to_s
  end

  def test_write_field_preserves_leading_empty_fields
    pid = HL7::Message::Segment::PID.new
    pid.patient_name = {:middle_name => 'Q'}
    assert_equal "PID|||||^^Q", pid.to_s
  end

  def test_write_field_preserves_internal_empty_fields
    pid = HL7::Message::Segment::PID.new
    pid.patient_name = {:family_name => 'DOE', :middle_name => 'Q'}
    assert_equal "PID|||||DOE^^Q", pid.to_s
  end

  def test_write_field_preserves_whitespace_only
    pid = HL7::Message::Segment::PID.new
    pid.patient_name = {:family_name => ' ', :middle_name => ' '}
    assert_equal "PID||||| ^^ ", pid.to_s
  end

  def test_write_field_all_empty
    pid = HL7::Message::Segment::PID.new
    pid.patient_name = {}
    assert_equal "PID|||||", pid.to_s
  end

  def test_write_field_first_empty
    pid = HL7::Message::Segment::PID.new
    pid.patient_name = {:family_name => ''}
    assert_equal "PID|||||", pid.to_s
  end

  def test_write_segment
    msg = HL7::Message.new
    msg.parse @simple_msh_txt
    assert_equal("ENADTEST", msg[:PID].patient_name["family_name"])

    # write replaces supplied field values
    msg[:PID].patient_name = {"family_name" => "JONES", "given_name" => "LEE"}
    assert_equal({'family_name' => 'JONES',
                  'given_name'  => 'LEE',
                  'middle_name' => 'JOHN'},  msg[:PID].patient_name)

    # write also must fill in missing fields with blank when supplied with a
    # field that does not exist in original data, because HL7 subfields must
    # comply with a fixed order in HL7 spec
    msg[:PID].patient_name = {"family_name" => "JONES", "given_name" => "LEE", "prefix" => "Mr."}
    assert_equal({'family_name' => 'JONES',
                  'given_name'  => 'LEE',
                  'middle_name' => 'JOHN',
                  'suffix'      => '',
                  'prefix'      => 'Mr.'},  msg[:PID].patient_name)
  end
end

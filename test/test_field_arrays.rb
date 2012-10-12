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

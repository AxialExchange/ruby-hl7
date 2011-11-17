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

  def test_write
    msg = HL7::Message.new
    msg.parse @simple_msh_txt
    assert_equal("ENADTEST", msg[:PID].patient_name["family_name"])
    msg[:PID].patient_name = {"family_name" => "JONES", "given_name" => "LEE"}
    assert_equal("JONES", msg[:PID].patient_name["family_name"])
    assert_equal("JONES", msg[:PID].patient_name["family_name"])
  end
end
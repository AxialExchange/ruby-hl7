$: << '../lib'
require 'test/unit'
require '../lib/ruby-hl7'

class BasicNameParsing < Test::Unit::TestCase
  def setup
    @simple_msh_txt = open('../test_data/pid_name.hl7').readlines
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
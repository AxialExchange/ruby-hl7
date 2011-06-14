$: << '../lib'
require 'test/unit'
require '../lib/ruby-hl7'

class BasicNameParsing < Test::Unit::TestCase
  def setup
    @simple_msh_txt = open( '../test_data/pid_name.hl7' ).readlines
  end

  def test_simple_pid
    msg = HL7::Message.new
    msg.parse @simple_msh_txt
    puts "Patient Name :: #{msg[:PID].patient_name["family_name"]}"
    puts "Patient Docs :: #{msg[:PV1].attending_doctor}"
    assert_equal(msg[:PID].patient_name["family_name"], "ENADTEST")
    assert_equal(msg[:PID].patient_name["given_name"], "INPATIENT")
    assert_equal(msg[:PID].patient_name["middle_name"], "JOHN")
    assert_equal(msg[:PV1].attending_doctor["given_name"], "ROBERT")
  end
end
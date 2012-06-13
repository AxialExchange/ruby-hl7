# encoding: UTF-8
require File.dirname(__FILE__) + '/test_helper'
\
class PidSegment < Test::Unit::TestCase
  def setup
    @base = "PID||MPI436015~4|333||LastName^FirstName^MiddleInitial^SR^NickName||19760228|F||||||||||555. 55|012345678"
  end

  def test_admin_sex_limits
    pid = HL7::Message::Segment::PID.new
    assert_nothing_raised do
      vals = %w[F M O U A N] + [ nil ]
      vals.each do |x|
        pid.admin_sex = x
      end
      pid.admin_sex = ""
    end

    assert_raises( HL7::InvalidDataError ) do
      ["TEST", "A", 1, 2].each do |x|
        pid.admin_sex = x
      end
    end
  end

  def test_odd_data
    pid_str = 'PID|ABC~XYZ||0533132^^^CARY^MR|||||||||||||||79561528^^^^PN'
    pid = HL7::Message::Segment::PID.new(pid_str)

    set_id = pid.set_id

    assert set_id.is_a?(String)

    assert_equal 'ABC~XYZ', set_id
  end

  def test_patient_id
    pid_str = 'PID||MPI1234~4|0533132^^^CARY^MR|||||||||||||||79561528^^^^PN'
    pid = HL7::Message::Segment::PID.new(pid_str)

    patient_id = pid.patient_id

    assert patient_id.is_a?(Array)

    assert_equal 'MPI1234', patient_id.first['id']
  end

  def test_patient_id_list
    pid_str = 'PID|||0533132^^^CARY^MR|||||||||||||||79561528^^^^PN'
    pid = HL7::Message::Segment::PID.new(pid_str)

    patient_id_list = pid.patient_id_list

    assert patient_id_list.is_a?(Hash)

    assert_equal '0533132', patient_id_list['id']
    assert_equal 'MR', patient_id_list['id_type_code']
  end

  def test_patient_id_list_repeat
    pid_str = 'PID|||0533132^^^CARY^MR~79561528^^^CARY^AN|||||||||||||||79561528^^^^PN'
    pid = HL7::Message::Segment::PID.new(pid_str)

    patient_id_list = pid.patient_id_list
    # puts pid.patient_id_list.inspect

    assert patient_id_list.is_a?(Array)
    assert_equal 2, patient_id_list.size

    assert_equal '79561528', patient_id_list.last['id']
    assert_equal 'AN', patient_id_list.last['id_type_code']
  end
end

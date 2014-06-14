# encoding: UTF-8
require File.expand_path('../test_helper.rb', __FILE__)

class MessageTypes < Test::Unit::TestCase
  def setup
  end

  def test_adt_a01
    msg = TestHelper.load_hl7(:adt_a01).first
    hl7_msg = HL7::Message.new
    hl7_msg.parse msg

    msh = hl7_msg.segments.select do |s|
            s.is_a? HL7::Message::Segment::MSH
          end.first

    assert_equal('ADT', msh.message_type['message_type'])
    assert_equal('A01', msh.message_type['trigger_event'])
  end

  def test_mdm_t02
    msg = TestHelper.load_hl7(:mdm_t02).first
    hl7_msg = HL7::Message.new
    hl7_msg.parse msg

    msh = hl7_msg.segments.select do |s|
            s.is_a? HL7::Message::Segment::MSH
          end.first

    assert_equal('MDM', msh.message_type['message_type'])
    assert_equal('T02', msh.message_type['trigger_event'])
  end
end

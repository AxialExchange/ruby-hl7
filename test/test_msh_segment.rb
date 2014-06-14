# encoding: UTF-8
require File.dirname(__FILE__) + '/test_helper'

class MSHSegment < Test::Unit::TestCase
  def setup
  end

  def test_enc_chars
    msh_str = "MSH|^~\\&|SMSPHM|Siemens RX|MD ALERT|AXIAL EXCHANGE|1995-12-27 03:24:16 -0500||ADT^A08|1995-12-27 03:24:16 -0500|P|2.3"
    msh = HL7::Message::Segment::MSH.new(msh_str)

    assert_equal "^~\\&", msh.enc_chars
    assert_equal 'SMSPHM', msh.sending_app
  end

  def test_set_message_type
    msh = HL7::Message::Segment::MSH.new
    msh.enc_chars = '^~\\&'

    msh.message_type = {"trigger_event" => "R01",
                        "message_type"  => "ORU"}
    assert_equal({"trigger_event" => "R01",
                  "message_type"  => "ORU"}, msh.message_type)

    msh.message_type = {:trigger_event => "A08",
                        :message_type  => "ADT"}
    assert_equal({"trigger_event" => "A08",
                  "message_type"  => "ADT"}, msh.message_type)

    msh.message_type = {:trigger_event => "M02",
                        :message_type  => "MFN"}
    assert_equal({"trigger_event" => "M02",
                  "message_type"  => "MFN"}, msh.message_type)

    msh.message_type = {"trigger_event" => nil,
                        "message_type"  => "ACK"}
    assert_equal({"message_type"  => "ACK"}, msh.message_type)

  end
end

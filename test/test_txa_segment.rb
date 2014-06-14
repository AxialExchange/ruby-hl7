# encoding: UTF-8
require File.expand_path('../test_helper.rb', __FILE__)

class TXASegment < Test::Unit::TestCase
  def setup
    msg = TestHelper.load_hl7(:mdm_t02).first
    hl7_msg = HL7::Message.new
    hl7_msg.parse msg

    @txa_str = hl7_msg.segments.select do |s|
                 s.is_a? HL7::Message::Segment::TXA
               end.first.to_s

    @txa = HL7::Message::Segment::TXA.new @txa_str
  end

  def test_set_id
    assert_equal '', @txa.set_id
  end

  def test_document_type
    assert_equal 'PDEDPRCERS^ED Provider Report', @txa.document_type
  end

  def test_document_content_presentation
    assert_equal '201406121203', @txa.document_content_presentation
  end

  def test_activity_date_time
    assert_equal '201406121151', @txa.activity_date_time
  end

  def test_primary_activity_provider_code_name
    # assert_equal {}, @txa.primary_activity_provider_code_name
  end

  def test_origination_date_time
    assert_equal '201406121151', @txa.origination_date_time
  end

  def test_transcription_date_time
    assert_equal '201406121151', @txa.transcription_date_time
  end

  def test_edit_date_time
    assert_equal '', @txa.edit_date_time
  end

  def test_originator_code_name
    assert_equal 'CPOUB1', @txa.originator_code_name['id_number']
    assert_equal 'CPOE', @txa.originator_code_name['family_name']
    assert_equal 'PSL1', @txa.originator_code_name['given_name']
  end

  def test_assigned_document_authenticator
    # assert_equal {}, @txa.assigned_document_authenticator
  end

  def test_transcriptionist_code_name
    assert_equal 'DR.CPOUB1', @txa.transcriptionist_code_name['id_number']
    assert_equal 'CPOE', @txa.transcriptionist_code_name['family_name']
    assert_equal 'PSL1', @txa.transcriptionist_code_name['given_name']
  end

  def test_unique_document_number
    assert_equal 'X.PDOC20140612-0003', @txa.unique_document_number
  end

  def test_parent_document_number
    assert_equal '', @txa.parent_document_number
  end

  def test_placer_order_number
    assert_equal '', @txa.placer_order_number
  end

  def test_filler_order_number
    assert_equal 'X.PDOC', @txa.filler_order_number
  end

  def test_unique_document_file_name
    assert_equal 'PDEDPRCERS', @txa.unique_document_file_name
  end

  def test_document_completion_status
    assert_equal 'Signed', @txa.document_completion_status
  end

  def test_document_confidentiality_status
    assert_equal '', @txa.document_confidentiality_status
  end

  def test_document_availability_status
    assert_equal '', @txa.document_availability_status
  end

  def test_document_storage_status
    assert_equal '', @txa.document_storage_status
  end

  def test_change_reason
    assert_equal '', @txa.change_reason
  end

  def test_authentication_person_time_stamp
    assert_equal 'CPOUB1^CPOE^PSL1^^^^^^^^^^^^201406121151', @txa.authentication_person_time_stamp
  end

  def test_distributed_copies
    # assert_equal '', @txa.distributed_copies
  end
end

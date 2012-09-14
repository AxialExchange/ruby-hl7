# encoding: UTF-8
require File.dirname(__FILE__) + '/test_helper'

class MrgSegment < Test::Unit::TestCase
  def setup
    @base = "MRG|0533132^^^CARY^MR"
  end

  def test_prior_patient_id
    mrg_str = "MRG|0533132^^^CARY^MR"
    mrg = HL7::Message::Segment::MRG.new(mrg_str)
    
    prior_patient_id = mrg.prior_patient_id
    assert prior_patient_id.is_a?(Hash)
    assert_equal '0533132', prior_patient_id['id']
  end

  def test_prior_patient_id_without_component
    mrg_str = "MRG|0533132"
    mrg = HL7::Message::Segment::MRG.new(mrg_str)
    
    prior_patient_id = mrg.prior_patient_id
    assert prior_patient_id.is_a?(Hash)
    assert_equal '0533132', prior_patient_id['id']
  end
end

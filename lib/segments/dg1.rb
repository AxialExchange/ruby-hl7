class HL7::Message::Segment::DG1 < HL7::Message::Segment
  add_field :set_id
  add_field :diagnosis_coding_method
  add_field :diagnosis_code, {:format => HL7::Message::DataTypes.CE}
  add_field :diagnosis_description
  add_field :diagnosis_date_time
  add_field :diagnosis_type
  add_field :major_diagnostic_category, {:format => HL7::Message::DataTypes.CE}
  add_field :diagnostic_related_group, {:format => HL7::Message::DataTypes.CE}
  add_field :drg_approval_indicator
  add_field :drg_grouper_review_code
  add_field :outlier_type, {:format => HL7::Message::DataTypes.CE}
  add_field :outlier_days
  add_field :outlier_cost
  add_field :grouper_version_and_type
  add_field :diagnosis_priority
  add_field :diagnosing_clinician, {:format => HL7::Message::DataTypes.XCN}
  add_field :diagnosis_classification
  add_field :confidential_indicator
  add_field :attestation_date_time
end
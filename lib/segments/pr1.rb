class HL7::Message::Segment::PR1 < HL7::Message::Segment
  add_field :set_id
  add_field :procedure_coding_method
  add_field :procedure_code, :format => HL7::Message::DataTypes.CE
  add_field :procedure_description
  add_field :procedure_date_time
  add_field :procedure_functional_type
  add_field :procedure_minutes
  add_field :anesthesiologist, :format => HL7::Message::DataTypes.XCN
  add_field :anesthesia_code
  add_field :anesthesia_minutes
  add_field :surgeon, :format => HL7::Message::DataTypes.XCN
  add_field :procedure_practitioner, :format => HL7::Message::DataTypes.XCN
  add_field :consent_code, :format => HL7::Message::DataTypes.CE
  add_field :procedure_priority
  add_field :associated_diagnosis_code, :format => HL7::Message::DataTypes.CE
  add_field :procedure_code_modifier, :format => HL7::Message::DataTypes.CE
end
# encoding: UTF-8

class HL7::Message::Segment::MRG < HL7::Message::Segment
  add_field :prior_patient_id, {:format => HL7::Message::DataTypes.CX}
  add_field :prior_alternate_patient_id, {:format => HL7::Message::DataTypes.CX}
  add_field :prior_patient_account_number, {:format => HL7::Message::DataTypes.CX}
  add_field :prior_patient_id_external, {:format => HL7::Message::DataTypes.CX}
  add_field :prior_visit_number, {:format => HL7::Message::DataTypes.CX}
  add_field :prior_alternate_visit_id, {:format => HL7::Message::DataTypes.CX}
  add_field :prior_patient_name
end

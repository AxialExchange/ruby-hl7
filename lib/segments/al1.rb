# encoding: UTF-8
class HL7::Message::Segment::AL1 < HL7::Message::Segment
  add_field :set_id
  add_field :allergy_type
  add_field :allergy_code
  add_field :allergy_severity
  add_field :allergy_reaction
  add_field :identification_date
end

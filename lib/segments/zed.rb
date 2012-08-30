# encoding: UTF-8
# Sample:
#   ZED|ABSCESS^Abscess|3C1-12 Cardiology|11108232
class HL7::Message::Segment::ZED < HL7::Message::Segment
  add_field :chief_complaint
  add_field :hospital_unit
  add_field :armband_id
end
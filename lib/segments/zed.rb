# encoding: UTF-8
# Sample:
#   ZED|ABSCESS^Abscess|3C1-12 Cardiology|11108232
class HL7::Message::Segment::ZED < HL7::Message::Segment
  add_field :unknown1
  add_field :unknown2
  add_field :armband_id
end
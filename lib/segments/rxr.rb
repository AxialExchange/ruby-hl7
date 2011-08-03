# encoding: UTF-8
class HL7::Message::Segment::RXR < HL7::Message::Segment
  add_field :route
  add_field :site
  add_field :administration_device
  add_field :adminsitration_method
  add_field :routing_instruction
end
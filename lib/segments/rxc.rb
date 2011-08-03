# encoding: UTF-8
class HL7::Message::Segment::RXC < HL7::Message::Segment
  add_field :rx_component_type
  add_field :component_code
  add_field :component_amount
  add_field :component_units
  add_field :component_strength
  add_field :component_strength_units
end
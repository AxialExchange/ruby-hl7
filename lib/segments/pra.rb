require 'ruby-hl7'

#PRA-2.1 (PRACTICE ID#) = 95066
#PRA-2.2 (PRACTICE NAME) = UPTOWN PEDS

class HL7::Message::Segment::PRA < HL7::Message::Segment
  add_field :practice_id
  add_field :practice
end
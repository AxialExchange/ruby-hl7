#PRA-2.1 (PRACTICE ID#) = 95066
#PRA-2.2 (PRACTICE NAME) = UPTOWN PEDS

class HL7::Message::Segment::PRA < HL7::Message::Segment
  add_field :practice_id
  add_field :practice
  add_field :practice_category
  add_field :provider_billing
  add_field :specialty
  add_field :practitioner_id_numbers
  add_field :privileges
  add_field :date_entered_practice
end
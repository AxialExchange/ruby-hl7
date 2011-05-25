require 'ruby-hl7'

#STF-2 (STAFF ID#) **repeating field**
#STF-2.1~1 (ID#) = 612345
#STF-2.5~1 (ID TYPE CODE) = STAFFID
#STF-2.1~2 (ID#) = 1234567890
#STF-2.5~2 (ID TYPE CODE) = NPI
#STF-3.1 (PHYS LAST NAME) = JONES
#STF-3.2 (PHYS FIRST NAME) = CAM
#STF-3.3 (PHYS MIDDLE NAME/INIT) = P
#STF-3.6 (TITLE) = MD
#STF-9 (HOSPITAL SERVICE) = EMERGENCY MEDICINE
#STF-10 (PHONE) = (919)555-5555
#STF-11 (ADDRESS) = 123 MAIN ROAD^^CARY^NC^27511
#STF-15 (EMAIL) = CJONES@PHYSPRACTICE.ORG

class HL7::Message::Segment::STF < HL7::Message::Segment
  add_field :ms_id
  add_field :staff_id
  add_field :name
  add_field :field_4
  add_field :field_5
  add_field :field_6
  add_field :field_7
  add_field :field_8
  add_field :hospital_service
  add_field :phone
  add_field :address
  add_field :field_12
  add_field :field_13
  add_field :field_14
  add_field :email
end
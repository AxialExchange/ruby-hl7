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
  add_field :staff_name
  add_field :staff_type
  add_field :sex
  add_field :date_time_of_birth
  add_field :active_inactive_flag
  add_field :department
  add_field :hospital_service
  add_field :phone
  add_field :address
  add_field :institution_activation_date
  add_field :institution_inactivation_date
  add_field :backup_person_id
  add_field :email
  add_field :preferred_method_of_contact
  add_field :marital_status
  add_field :job_title
  add_field :job_code_class
  add_field :employment_status
  add_field :additional_insured_on_auto
  add_field :drivers_license_no
  add_field :copy_auto_insurance
  add_field :auto_insurance_expires
  add_field :date_last_dmv_review
  add_field :date_next_dmv_review
end
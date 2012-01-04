=begin
  NK1-1   SI      4  Set ID - NK1
  NK1-2   XPN    48  Name
  NK1-3   CE     60  Relationship
  NK1-4   XAD   106  Address
  NK1-5   XTN    40  Phone Number
  NK1-6   XTN    40  Business Phone Number
  NK1-7   CE     60  Contact Role
  NK1-8   DT      8  Start Date
  NK1-9   DT      8  End Date
  NK1-10  ST     60  Next of Kin/Associated Parties Job Title
  NK1-11  CM     20  Next of Kin Job/Associated Parties Code/Class
  NK1-12  CX     20  Next of Kin/Associated Parties Employee Number
  NK1-13  XON    60  Organization Name
  NK1-14  IS      2  Marital Status
  NK1-15  IS      1  Sex
  NK1-16  TS     26  Date/Time of Birth
  NK1-17  IS      2  Living Dependency
  NK1-18  IS      2  Ambulatory Status
  NK1-19  IS      4  Citizenship
  NK1-20  CE     60  Primary Language
  NK1-21  IS      2  Living Arrangement
  NK1-22  CE     80  Publicity Indicator
  NK1-23  ID      1  Protection Indicator
  NK1-24  IS      2  Student Indicator
  NK1-25  IS      3  Religion
  NK1-26  XPN    48  Mothers Maiden Name
  NK1-27  CE     80  Nationality
  NK1-28  IS      3  Ethnic Group
  NK1-29  CE     80  Contact Reason
  NK1-30  XPN    48  Contact Persons Name
  NK1-31  XTN    40  Contact Persons Telephone Number
  NK1-32  XAD   106  Contact Persons Address
  NK1-33  CX     32  Associated Partys Identifiers
  NK1-34  IS      2  Job Status
  NK1-35  IS      1  Race
  NK1-36  IS      2  Handicap
  NK1-37  ST     16  Contact Person Social Security Number

=end
# encoding: UTF-8
class HL7::Message::Segment::NK1 < HL7::Message::Segment
  add_field :set_id
  add_field :name, {:format => HL7::Message::DataTypes.XPN}
  add_field :relationship, {:format => HL7::Message::DataTypes.CE}
  add_field :address, {:format => HL7::Message::DataTypes.XAD}
  add_field :phone_number, {:format => HL7::Message::DataTypes.XTN}
  add_field :business_phone_number, {:format => HL7::Message::DataTypes.XTN}
  add_field :contact_role, {:format => HL7::Message::DataTypes.CE}
  add_field :start_date
  add_field :end_date
  add_field :job_title
  add_field :code_class
  add_field :employee_number, {:format => HL7::Message::DataTypes.CX}
  add_field :organization_name, {:format => HL7::Message::DataTypes.XON}
  add_field :marital_status
  add_field :sex
  add_field :date_of_birth
  add_field :living_dependency
  add_field :ambulatory_status
  add_field :citizenship
  add_field :primary_language, {:format => HL7::Message::DataTypes.CE}
  add_field :living_arrangement
  add_field :publicity_indicator, {:format => HL7::Message::DataTypes.CE}
  add_field :protection_indicator
  add_field :student_indicator
  add_field :religion
  add_field :mothers_maiden_name, {:format => HL7::Message::DataTypes.XPN}
  add_field :nationality, {:format => HL7::Message::DataTypes.CE}
  add_field :ethnic_group
  add_field :contact_reason, {:format => HL7::Message::DataTypes.CE}
  add_field :contact_persons_name, {:format => HL7::Message::DataTypes.XPN}
  add_field :contact_persons_telephone_number, {:format => HL7::Message::DataTypes.XTN}
  add_field :contact_persons_address, {:format => HL7::Message::DataTypes.XAD}
  add_field :associated_partys_identifiers, {:format => HL7::Message::DataTypes.CX}
  add_field :job_status
  add_field :race
  add_field :handicap
  add_field :contact_persons_ssn
end
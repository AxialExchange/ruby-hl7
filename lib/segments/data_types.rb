module HL7::Message::DataTypes
  attr_reader :XPN      #Extended Person Name
  attr_reader :XAD      #Extended Address
  attr_reader :CN       #Composite ID number and name
  attr_reader :XCN      #Extended Composite ID number and name
  attr_reader :MSG_TYPE #MSH Segment - Message Type (009)
  attr_reader :CX       #Extended Composite ID with Check Digit
  attr_reader :PL       #Place

  def self.XPN #for HL7 v2.3
    ["family_name", "given_name", "middle_name", "suffix", "prefix", "degree", "name_type_code", "name_representation_code"]
  end

  def self.XAD #for HL7 v2.3
    ["street_address", "other_designation", "city", "state_province", "zip_postal_code", "country", "address_type", "other_geographic_designation", "county_parish", "census_tract", "address_representation_cod"]
  end

  def self.CN
    ["id_number", "family_name", "given_name", "middle_name", "suffix", "prefix", "degree", "source_table", "assigning_authority"]
  end

  def self.XCN #for HL7 v2.3
    ["id_number", "family_name", "given_name", "middle_name", "suffix", "prefix", "degree", "source_table", "assigning_authority", "name_type_code", "id_check_digit", "check_digit_scheme", "id_type_code", "assigning_facility", "name_representation_code"]
  end

  def self.MSG_TYPE
    ["message_type", "trigger_event"]
  end

  def self.CX
    ["id", "check_digit", "code_scheme", "assigning_authority", "id_type_code", "assigning_facility"]
  end

  def self.PL
    ["point_of_care", "room", "bed", "facility", "location_status", "person_location_type", "building", "floor", "location_description"]
  end

end
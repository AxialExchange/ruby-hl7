# encoding: UTF-8
class HL7::Message::Segment::ORC < HL7::Message::Segment
  add_field :order_control
  add_field :placer_order_number
  add_field :filler_order_number
  add_field :placer_group_number
  add_field :order_status
  add_field :response_flag
  add_field :quantity_timing
  add_field :parent
  add_field :date_time_of_transaction
  add_field :entered_by
  add_field :verified_by
  add_field :ordering_provider
  add_field :enterers_location
  add_field :call_back_phone_number
  add_field :order_effective_date_time
  add_field :order_control_code_reason
  add_field :entering_organization
  add_field :entering_device
  add_field :action_by
  add_field :advanced_beneficiary_notice_code
  add_field :ordering_facility_name
  add_field :ordering_facility_address
  add_field :ordering_facility_phone_number
  add_field :ordering_provider_address
end
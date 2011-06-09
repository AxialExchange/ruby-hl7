# encoding: UTF-8
class HL7::Message::Segment::ZP1 < HL7::Message::Segment
  add_field :notify_private_physician
  add_field :practice_id
  add_field :no_news
  add_field :selective_privacy
  add_field :employer
end
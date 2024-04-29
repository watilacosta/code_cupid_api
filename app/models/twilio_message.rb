# frozen_string_literal: true

class TwilioMessage < ApplicationRecord
  validates :phone_number, presence: true
  validates :twilio_message_sid, presence: true
end
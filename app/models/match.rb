# frozen_string_literal: true

class Match < ApplicationRecord
  belongs_to :user
  belongs_to :matched_user
end

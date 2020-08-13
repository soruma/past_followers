# frozen_string_literal: true

class PastFollower < ApplicationRecord
  belongs_to :user

  validates :followers_count, presence: true
end

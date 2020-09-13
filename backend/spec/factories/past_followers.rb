# frozen_string_literal: true

FactoryBot.define do
  factory :past_follower do
    user
    followers_count { 1 }
  end
end

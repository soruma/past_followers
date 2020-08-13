# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:screen_name, 'screen_name_1')
    name { 'Name' }
    profile_image_url { 'http://example.com/profile_image.png' }
  end
end

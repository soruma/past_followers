# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence(:screen_name, 'screen_name_1')
    name { 'Name' }
  end
end

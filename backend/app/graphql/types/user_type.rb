# frozen_string_literal: true

module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :screen_name, String, null: true
    field :name, String, null: true
    field :description, String, null: true
    field :profile_image_url, String, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :past_followers, [Types::PastFollowerType], null: false
  end
end

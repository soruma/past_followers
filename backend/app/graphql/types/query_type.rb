# frozen_string_literal: true

module Types
  class QueryType < Types::BaseObject
    field :users, [Types::UserType], null: false
    def users
      User.all
    end

    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end
    def user(id:)
      User.find(id)
    end

    field :past_followers, [Types::PastFollowerType], null: false do
      argument :user_id, Int, required: true
    end
    def past_followers(user_id:)
      PastFollower.where(user_id: user_id)
    end

    field :past_follower, Types::PastFollowerType, null: false do
      argument :id, Int, required: true
    end
    def past_follower(id:)
      PastFollower.find(id).order(:create_at)
    end
  end
end

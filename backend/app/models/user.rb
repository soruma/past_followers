# frozen_string_literal: true

class User < ApplicationRecord
  has_many :past_followers, dependent: :destroy

  validates :name, :screen_name, :profile_image_url, presence: true
  validates :profile_image_url, url: true

  def self.update_profile(args)
    twitter_user = TwitterProfileGetter.call(args)
    user = for_twitter_user_to_user(twitter_user)
    user.save!

    user
  end

  def self.for_twitter_user_to_user(twitter_user)
    user = find_or_initialize_by(id: twitter_user.id)

    user.screen_name = twitter_user.screen_name
    user.name = twitter_user.name
    user.description = twitter_user.description.presence
    user.profile_image_url = twitter_user.profile_image_url_https(:original)
    user.past_followers.new(followers_count: twitter_user.followers_count)

    user
  end
  private_class_method :for_twitter_user_to_user
end

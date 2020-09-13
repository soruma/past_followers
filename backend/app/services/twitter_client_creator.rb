# frozen_string_literal: true

class TwitterClientCreator
  include Callable

  def initialize(*)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_CLIENT_CONSUMER_KEY']
      config.consumer_secret = ENV['CONSUMER_SECRET']
      config.access_token = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end
  end

  protected

  attr_reader :client
end

# frozen_string_literal: true

class TwitterProfileGetter < TwitterClientCreator
  def initialize(screen_name:)
    super

    @screen_name = screen_name
  end

  # Return Twitter::User class
  def call
    client.user(screen_name)
  end

  private

  attr_reader :screen_name
end

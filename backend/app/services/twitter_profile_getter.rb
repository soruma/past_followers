# frozen_string_literal: true

class TwitterProfileGetter < TwitterClientCreator
  def initialize(args)
    super

    @user = if args[:user]
              args[:user]
            elsif args[:screen_name]
              User.new(screen_name: args[:screen_name])
            elsif args[:user_id]
              User.new(id: args[:user_id])
            end
  end

  # Return Twitter::User class
  def call
    if user.id
      client.user(user.id)
    else
      client.user(user.screen_name)
    end
  end

  private

  attr_reader :user
end

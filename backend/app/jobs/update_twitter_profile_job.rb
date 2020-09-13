# frozen_string_literal: true

class UpdateTwitterProfileJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    User.find_each do |user|
      User.update_profile(user: user)
    end
  end
end

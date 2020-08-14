# frozen_string_literal: true

require 'sidekiq/web'
require 'sidekiq-scheduler/web'

Rails.application.routes.draw do
  if Rails.env.development?
    mount Sidekiq::Web, at: '/sidekiq'
  end
end

# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ENV['INIT_USERS'].split(',').each do |screen_name|
  twitter_user = TwitterProfileGetter.call(screen_name: screen_name)
  User.for_twitter_user_to_user(twitter_user).save
end

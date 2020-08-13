# frozen_string_literal: true

require 'rails_helper'

describe TwitterProfileGetter do
  describe '#call' do
    it 'return of Twitter::User class' do
      VCR.use_cassette('twitter/user/show/soruma', match_requests_on: [:uri]) do
        user = described_class.call(screen_name: 'soruma')

        expect(user.class).to eq Twitter::User
        expect(user.screen_name).to eq 'soruma'
        expect(user.name).to eq 'そるま'
        expect(user.description).to eq 'サイクリストエンジニア ミクさんを愛するメガネ属性/VB.NET/Ruby/Elixier勉強中..'
        expect(user.profile_image_url_https(:original)).to eq Addressable::URI.parse('https://pbs.twimg.com/profile_images/711080078478737408/S5rZ-z6C.jpg')
        expect(user.followers_count).to eq 25
      end
    end
  end
end

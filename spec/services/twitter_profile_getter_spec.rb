# frozen_string_literal: true

require 'rails_helper'

describe TwitterProfileGetter do
  describe '#call' do
    shared_examples 'Return twitter profile' do |query|
      it 'return of Twitter::User class' do
        VCR.use_cassette("twitter/user/show/soruma.#{query}", match_requests_on: [:uri]) do
          user = described_class.call(args)

          expect(user.class).to eq Twitter::User
          expect(user.id).to eq 117_057_091
          expect(user.screen_name).to eq 'soruma'
          expect(user.name).to eq 'そるま'
          expect(user.description).to eq 'サイクリストエンジニア ミクさんを愛するメガネ属性/VB.NET/Ruby/Elixier勉強中..'
          expect(user.profile_image_url_https(:original)).to eq Addressable::URI.parse('https://pbs.twimg.com/profile_images/711080078478737408/S5rZ-z6C.jpg')
          expect(user.followers_count).to eq 25
        end
      end
    end

    context 'args is user' do
      let(:args) { { user: create(:user, id: 117_057_091) } }
      it_behaves_like 'Return twitter profile', query: :user_id
    end

    context 'args is screen_name' do
      let(:args) { { screen_name: 'soruma' } }
      it_behaves_like 'Return twitter profile', query: :screen_name
    end

    context 'args is user_id' do
      let(:args) { { user_id: 117_057_091 } }
      it_behaves_like 'Return twitter profile', query: :user_id
    end
  end
end

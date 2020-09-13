# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User', type: :request do
  subject { post graphql_path, params: { query: query }.merge(args) }

  describe '#show' do
    before do
      user = create(:user,
                    id: 123,
                    screen_name: 'アリス',
                    name: 'alice',
                    description: 'アリスの説明',
                    profile_image_url: 'http://example.com/profile_image.png',
                    created_at: Time.zone.parse('2020-05-11 10:00:00'),
                    updated_at: Time.zone.parse('2020-06-21 11:20:00'))

      user.past_followers << create(:past_follower, followers_count: 2)
    end

    let(:query) { GraphQL::Requests.user }
    let(:args) { { variables: '{ "id": 123 }' } }

    it 'return user in json format using id' do
      subject

      result = JSON.parse(response.body, symbolize_names: true)
      user = result[:data][:user]
      expect(user[:screenName]).to eq 'アリス'
      expect(user[:name]).to eq 'alice'
      expect(user[:description]).to eq 'アリスの説明'
      expect(user[:profileImageUrl]).to eq 'http://example.com/profile_image.png'
      expect(user[:createdAt]).to eq '2020-05-11T10:00:00Z'
      expect(user[:updatedAt]).to eq '2020-06-21T11:20:00Z'
    end
  end
end

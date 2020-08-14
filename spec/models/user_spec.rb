# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'association' do
    it { is_expected.to have_many(:past_followers).dependent(:destroy) }
  end

  describe 'validation' do
    it 'is valid with name and screen_name and profile_image_url' do
      user = build(:user)
      expect(user).to be_valid
    end

    it 'does not allow blank name' do
      user = build(:user, name: nil)
      expect(user).to be_invalid
    end

    it 'does not allow blank screen_name' do
      user = build(:user, screen_name: nil)
      expect(user).to be_invalid
    end

    it 'does not allow blank profile_image_url' do
      user = build(:user, profile_image_url: nil)
      expect(user).to be_invalid
    end

    it 'does not allow not url format profile_image_url' do
      user = build(:user, profile_image_url: 'alice')
      expect(user).to be_invalid
    end
  end

  describe '.update_profile' do
    let(:target_user) { create(:user, id: 117_057_091, name: 'old_name') }

    it 'return updated user' do
      VCR.use_cassette('twitter/user/show/soruma_query_user_id_', match_requests_on: [:uri]) do
        user = described_class.update_profile(user: target_user)

        expect(user.name).to eq 'そるま'
      end
    end
  end

  describe '.for_twitter_user_to_user' do
    let(:twitter_user) do
      Twitter::User.new(
        id: 123,
        screen_name: 'screen_name',
        name: 'name',
        description: 'description',
        followers_count: 10
      )
    end
    let(:user) { described_class.send(:for_twitter_user_to_user, twitter_user) }

    before do
      allow(twitter_user).to receive(:profile_image_url_https).with(:original).and_return('url')
    end

    it 'convert argment to a user' do
      expect(twitter_user).to receive(:profile_image_url_https).with(:original).and_return('url')

      expect(user.class).to eq described_class
      expect(user.id).to eq 123
      expect(user.screen_name).to eq 'screen_name'
      expect(user.name).to eq 'name'
      expect(user.description).to eq 'description'
      expect(user.past_followers.last.followers_count).to eq 10
    end

    context 'user already exists' do
      before do
        user = create(:user, id: 123, name: 'old_name')
        user.past_followers << create(:past_follower, followers_count: 9)
      end

      it 'user is update' do
        expect(twitter_user).to receive(:profile_image_url_https).with(:original).and_return('url')

        expect(user.id).to eq 123
        expect(user.name).to eq 'name'
        expect(user.past_followers.last.followers_count).to eq 10
      end
    end

    context 'witout description' do
      let(:twitter_user) do
        Twitter::User.new(
          id: 123,
          screen_name: 'screen_name',
          name: 'name',
          description: Twitter::NullObject.new,
          followers_count: 10
        )
      end

      it 'convert argment to a user' do
        expect(user.class).to eq described_class
        expect(user.id).to eq 123
        expect(user.description).to eq nil
      end
    end
  end
end

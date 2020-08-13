# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe '.for_twitter_user_to_user' do
    let(:twitter_user) do
      double('Twitter User',
             id: 123,
             screen_name: 'screen_name',
             name: 'name',
             description: 'description')
    end
    let(:user) { described_class.for_twitter_user_to_user(twitter_user) }

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
    end

    context 'user already exists' do
      before { create(:user, id: 123, name: 'old_name') }

      it 'user is update' do
        expect(twitter_user).to receive(:profile_image_url_https).with(:original).and_return('url')

        expect(user.id).to eq 123
        expect(user.name).to eq 'name'
      end
    end

    context 'witout description' do
      let(:twitter_user) do
        double('Twitter User',
               id: 123,
               screen_name: 'screen_name',
               name: 'name',
               description: Twitter::NullObject.new)
      end

      it 'convert argment to a user' do
        expect(user.class).to eq described_class
        expect(user.id).to eq 123
        expect(user.description).to eq nil
      end
    end
  end
end

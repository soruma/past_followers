# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PastFollower, type: :model do
  describe 'association' do
    it { is_expected.to belong_to :user }
  end

  describe 'validation' do
    it 'is valid with followers_count' do
      past_follower = build(:past_follower)
      expect(past_follower).to be_valid
    end

    it 'does not allow blank followers_count' do
      past_follower = build(:past_follower, followers_count: nil)
      expect(past_follower).to be_invalid
    end
  end
end

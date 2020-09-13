# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UpdateTwitterProfileJob, type: :job do
  describe '#perform' do
    let(:user) { create(:user) }

    it 'Update user with twitter profile' do
      expect(User).to receive(:update_profile).with(user: user)

      described_class.perform_now
    end
  end
end

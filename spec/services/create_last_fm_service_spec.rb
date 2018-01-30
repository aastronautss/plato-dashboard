# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateLastFmService do
  subject { CreateLastFmService.new }
  let(:action) { subject.call }

  describe '#call' do
    it 'sets the auth_url' do
      action

      expect(subject.auth_url).to be_present
    end

    it 'creates a MusicScrobbleService' do
      expect { action }.to change { LastFmService.count }.by(1)
    end
  end
end

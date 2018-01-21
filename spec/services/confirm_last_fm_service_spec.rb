# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ConfirmLastFmService, vcr: { match_requests_on: [:method, :host] } do
  let(:service) { build :music_scrobble_service }
  let(:token) { ENV['LASTFM_DUMMY_TOKEN'] }
  subject { ConfirmLastFmService.new service, token }

  describe '#call' do
    let(:action) { subject.call }

    it 'updates the service' do
      expect(service.data[:session]).to_not be_present
      action

      expect(service.data[:session]).to be_present
    end
  end
end

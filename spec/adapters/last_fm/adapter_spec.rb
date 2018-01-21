# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LastFm::Adapter, :vcr do
  describe '.new_client' do
    subject { LastFm::Adapter }
    let(:action) { subject.new_client }

    it 'returns a new client' do
      expect(action).to be_a(Lastfm)
    end
  end

  describe '.generate_auth_url' do
    subject { LastFm::Adapter }
    let(:action) { subject.generate_auth_url }

    it 'returns a string' do
      expect(action).to be_a(String)
    end
  end

  describe '.fetch_new_session_data', vcr: { match_requests_on: [:method, :host] } do
    subject { LastFm::Adapter }
    let(:action) { subject.fetch_new_session_data(ENV['LASTFM_DUMMY_TOKEN']) }

    it 'returns a hash' do
      expect(action).to be_a(Hash)
    end
  end
end

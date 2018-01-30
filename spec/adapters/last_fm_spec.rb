# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LastFm, :vcr do
  subject { LastFm }

  describe '.new' do
    let(:service) { build_stubbed :last_fm_service }
    let(:action) { subject.new service }

    it 'returns an Adapter' do
      expect(action).to be_a(LastFm::Adapter)
    end
  end

  describe '.generate_auth_url' do
    let(:action) { subject.generate_auth_url callback_url: 'abc' }

    it 'delegates' do
      expect(LastFm::Adapter).to receive(:generate_auth_url).with(kind_of Hash)

      action
    end
  end

  describe '.fetch_new_session_data' do
    let(:action) { subject.fetch_new_session_data('abc') }

    it 'delegates' do
      expect(LastFm::Adapter).to receive(:fetch_new_session_data).with('abc')

      action
    end
  end

  describe 'interface contracts' do
    specify { expect(LastFm::Adapter).to respond_to(:generate_auth_url) }
    specify { expect(LastFm::Adapter).to respond_to(:fetch_new_session_data).with(1).argument }
  end
end

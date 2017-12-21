# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Headphones::Adapter, :vcr do
  let(:service) do
    instance_double MusicDownloadService,
      host: ENV['HEADPHONES_HOST'],
      port: ENV['HEADPHONES_PORT'],
      http_root: ENV['HEADPHONES_HTTP_ROOT'],
      api_key: ENV['HEADPHONES_API_KEY']
  end

  subject { Headphones::Adapter.new service }

  # delegation to Hphones lib

  describe '#respond_to?' do
    it 'passes stuff through to the Hphones client' do
      expect(subject.respond_to? :get_index).to be(true)
    end
  end

  describe '#dummy_method' do
    let(:action) { subject.dummy_method }

    it 'raises an error' do
      expect { action }.to raise_error(NoMethodError)
    end
  end

  describe '#get_index' do
    it 'returns something' do
      expect(subject.get_index).to be_an(Object)
    end
  end

  # Implemented methods

  describe '#get_artist' do
    let(:action) { subject.get_artist id: 'fc7bbf00-fbaa-4736-986b-b3ac0266ca9b' }

    it 'returns an Artist object' do
      result = action

      expect(result).to respond_to(:name)
      expect(result).to respond_to(:id)
    end
  end

  describe '#find_artist' do
    let(:action) { subject.find_artist name: 'alt j' }

    it 'returns an enumerable' do
      expect(action).to respond_to(:each)
    end

    it 'has Artist objects in the array' do
      result = action

      expect(result.first).to respond_to(:name)
      expect(result.first).to respond_to(:id)
      expect(result.first).to respond_to(:score)
    end
  end
end

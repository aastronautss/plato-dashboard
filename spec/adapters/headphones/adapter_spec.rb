# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Headphones::Adapter, :vcr do
  let(:service) { build_stubbed :music_download_service }

  subject { Headphones::Adapter.new service }

  # delegation to Hphones lib

  describe '#respond_to?' do
    it 'passes stuff through to the Hphones client' do
      expect(subject.respond_to? :get_similar).to be(true)
    end
  end

  describe '#dummy_method' do
    let(:action) { subject.dummy_method }

    it 'raises an error' do
      expect { action }.to raise_error(NoMethodError)
    end
  end

  describe '#get_similar' do
    let(:action) { subject.get_similar }

    it 'returns something' do
      expect(action).to be_an(Object)
    end
  end

  # Implemented methods

  describe '#get_index' do
    let(:action) { subject.get_index }

    it 'returns an enumerable' do
      expect(action).to respond_to(:each)
    end

    it 'has Artist objects' do
      result = action

      expect(result.first).to respond_to(:name)
      expect(result.first).to respond_to(:id)
    end
  end

  describe '#get_artist' do
    let(:action) { subject.get_artist id: 'fc7bbf00-fbaa-4736-986b-b3ac0266ca9b' }

    it 'returns an Artist object' do
      result = action

      expect(result).to respond_to(:name)
      expect(result).to respond_to(:id)
    end

    it 'returns with params present' do
      result = action

      expect(result.name).to be_present
      expect(result.id).to be_present
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

  describe '#add_artist' do
    let(:action) { subject.add_artist id: 'fc7bbf00-fbaa-4736-986b-b3ac0266ca9b' }

    it 'returns a successful result' do
      expect(action).to be(true)
    end
  end

  describe '#get_wanted' do
    let(:action) { subject.get_wanted }

    it 'returns an enumerable' do
      expect(action).to respond_to(:each)
    end

    it 'has Album objects' do
      result = action

      expect(result.first).to respond_to(:title)
      expect(result.first).to respond_to(:id)
    end
  end

  describe '#get_upcoming' do
    let(:action) { subject.get_upcoming }

    it 'returns an enumerable' do
      expect(action).to respond_to(:each)
    end

    it 'has Album objects' do
      result = action

      expect(result.first).to respond_to(:title)
      expect(result.first).to respond_to(:id)
    end
  end

  describe '#find_album' do
    let(:action) { subject.find_album name: 'masseduction' }

    it 'returns an enumerable' do
      expect(action).to respond_to(:each)
    end

    it 'has Album objects in the array' do
      result = action

      expect(result.first).to respond_to(:title)
      expect(result.first).to respond_to(:id)
      expect(result.first).to respond_to(:score)
    end
  end

  describe '#get_album' do
    let(:action) { subject.get_album id: '8a103b36-a632-425f-8980-da934b0c1eb3' }

    it 'returns an Album object' do
      result = action

      expect(result).to respond_to(:title)
      expect(result).to respond_to(:id)
    end

    it 'returns with params present' do
      result = action

      expect(result.title).to be_present
      expect(result.id).to be_present
    end
  end

  describe '#add_album' do
    let(:action) { subject.add_album id: '8a103b36-a632-425f-8980-da934b0c1eb3' }

    it 'returns a successful result' do
      expect(action).to be(true)
    end
  end

  describe '#remove_album' do
    let(:action) { subject.remove_album id: '8a103b36-a632-425f-8980-da934b0c1eb3' }

    it 'returns a successful result' do
      expect(action).to be(true)
    end
  end
end

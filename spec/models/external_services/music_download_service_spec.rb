# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MusicDownloadService do
  subject do
    MusicDownloadService.new app: 'Headphones',
      data: { host: 'localhost', port: 123, http_root: 'abc', api_key: 'abc123' }
  end

  describe '.apps' do
    subject { MusicDownloadService }

    let(:action) { subject.apps }

    it 'returns a hash' do
      expect(action).to be_a(Hash)
    end
  end

  describe '#host' do
    it 'retrieves the object from data' do
      expect(subject.host).to eq('localhost')
    end
  end

  describe '#port' do
    it 'retrieves the object from data' do
      expect(subject.port).to eq(123)
    end
  end

  describe '#http_root' do
    it 'retrieves the object from data' do
      expect(subject.http_root).to eq('abc')
    end
  end

  describe '#api_key' do
    it 'retrieves the object from data' do
      expect(subject.api_key).to eq('abc123')
    end
  end
end

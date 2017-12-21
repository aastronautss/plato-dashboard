# frozen_string_literal: true

RSpec.describe Headphones::ArtistSearchResult do
  specify { expect(subject).to respond_to(:artist) }
  specify { expect(subject).to respond_to(:score) }

  describe '#id' do
    it 'delegates to the artist' do
      expect { subject.id }.to_not raise_error
    end
  end

  describe '#name' do
    it 'delegates to the artist' do
      expect { subject.name }.to_not raise_error
    end
  end

  describe '#url' do
    it 'delegates to the artist' do
      expect { subject.url }.to_not raise_error
    end
  end
end

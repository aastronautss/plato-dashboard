# frozen_string_literal: true

RSpec.describe Headphones::AlbumSearchResult do
  specify { expect(subject).to respond_to(:album) }
  specify { expect(subject).to respond_to(:score) }

  describe '#id' do
    it 'delegates to the album' do
      expect { subject.id }.to_not raise_error
    end
  end

  describe '#title' do
    it 'delegates to the album' do
      expect { subject.title }.to_not raise_error
    end
  end

  describe '#url' do
    it 'delegates to the album' do
      expect { subject.url }.to_not raise_error
    end
  end
end

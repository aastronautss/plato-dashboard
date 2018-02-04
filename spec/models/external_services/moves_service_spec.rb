# frozen_string_literal: true

RSpec.describe MovesService do
  subject { build :moves_service }

  describe '#adapter' do
    let(:action) { subject.adapter }

    it 'returns the right adapter' do
      expect(action).to be_a(MovesWrapper::Adapter)
    end
  end

  describe '#confirmed?' do
    let(:action) { subject.confirmed? }

    it 'returns false with no access token' do
      expect(action).to be(false)
    end

    context 'with an access token' do
      subject { build :moves_service, :confirmed }

      it 'returns true' do
        expect(action).to be(true)
      end
    end
  end

  describe '#access_token' do
    subject { build :moves_service, :confirmed }
    let(:action) { subject.access_token }

    it 'returns the access token from data' do
      value = action

      expect(value).to be_present # sanity check
      expect(value).to eq(subject.data[:access_token])
    end
  end

  describe '#refresh_token' do
    subject { build :moves_service, :confirmed }
    let(:action) { subject.refresh_token }

    it 'returns the access token from data' do
      value = action

      expect(value).to be_present # sanity check
      expect(value).to eq(subject.data[:refresh_token])
    end
  end
end

# frozen_string_literal: true

RSpec.describe FacebookService do
  subject { build :facebook_service }

  describe '#adapter' do
    let(:action) { subject.adapter }

    it 'returns the right adapter' do
      expect(action).to be_a(Facebook::Adapter)
    end
  end

  describe '#confirmed?' do
    let(:action) { subject.confirmed? }

    it 'returns false with no access token' do
      expect(action).to be(false)
    end

    context 'with an access token' do
      subject { build :facebook_service, :confirmed }

      it 'returns true' do
        expect(action).to be(true)
      end
    end
  end

  describe '#access_token' do
    subject { build :facebook_service, :confirmed }
    let(:action) { subject.access_token }

    it 'returns the access token from data' do
      value = action

      expect(value).to be_present
      expect(value).to eq(subject.data[:access_token])
    end
  end

  describe '#access_token_expires_on' do
    subject { build :facebook_service, :confirmed }
    let(:action) { subject.access_token_expires_on }

    it 'returns a time' do
      expect(action).to be_a(Time)
    end

    it 'is the same as the data value' do
      expect(action).to eq(subject.data[:access_token_expires_on])
    end
  end
end

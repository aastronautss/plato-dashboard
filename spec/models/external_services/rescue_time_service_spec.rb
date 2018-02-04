# frozen_string_literal: true

RSpec.describe RescueTimeService do
  subject { build :rescue_time_service }

  describe '#adapter' do
    let(:action) { subject.adapter }

    it 'returns the right adapter' do
      expect(action).to be_a(RescueTime::Adapter)
    end
  end

  describe '#confirmed?' do
    let(:action) { subject.confirmed? }

    it 'returns false with no access token' do
      expect(action).to be(false)
    end

    context 'with an access token' do
      subject { build :rescue_time_service, :confirmed }

      it 'returns true' do
        expect(action).to be(true)
      end
    end
  end

  describe '#api_key' do
    subject { build :rescue_time_service, :confirmed }
    let(:action) { subject.api_key }

    it 'returns the access token from data' do
      value = action

      expect(value).to be_present
      expect(value).to eq(subject.data[:api_key])
    end
  end
end

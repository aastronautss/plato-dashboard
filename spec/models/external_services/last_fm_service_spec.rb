# frozen_string_literal: true

RSpec.describe LastFmService do
  subject { build :last_fm_service }

  describe '#adapter' do
    let(:action) { subject.adapter }

    it 'returns the right adapter class' do
      expect(action).to be_a(LastFm::Adapter)
    end
  end

  describe '#confirmed?' do
    let(:action) { subject.confirmed? }

    it 'returns false with no session' do
      expect(action).to be(false)
    end

    context 'when there is a session' do
      subject { build :last_fm_service, :confirmed }

      it 'returns true' do
        expect(action).to be(true)
      end
    end
  end

  describe '#session' do
    subject { build :last_fm_service, :confirmed }
    let(:action) { subject.session }

    it 'returns the session from data' do
      expect(action).to eq(subject.data[:session])
    end
  end

  describe '#username' do
    subject { build :last_fm_service, :confirmed }
    let(:action) { subject.username }

    it 'returns the username from data' do
      expect(action).to eq(subject.data[:username])
    end
  end
end

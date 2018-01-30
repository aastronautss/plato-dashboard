# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ExternalService do
  describe 'validations' do
    it { should validate_presence_of(:type) }
  end

  describe '#data' do
    let(:service) { build :headphones_service }
    let(:action) { service.data }

    it 'allows indifferent access' do
      expect(action[:host]).to eq(action['host'])
    end
  end

  describe '#adapter' do
    let(:service) { build :headphones_service }
    let(:action) { service.adapter }

    it 'returns an instance of the corresponding adapter' do
      expect(action).to be_a(Headphones::Adapter)
    end
  end
end

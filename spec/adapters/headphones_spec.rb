# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Headphones do
  describe '.new' do
    subject { Headphones }

    let(:service) { build_stubbed :headphones_service }
    let(:action) { subject.new service }

    it 'returns an Adapter' do
      expect(action).to be_a(Headphones::Adapter)
    end
  end
end

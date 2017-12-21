# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Headphones do
  describe '.new' do
    subject { Headphones }

    let(:service) { double 'service', host: 'localhost', port: 123, http_root: 'hello', api_key: 'abc' }
    let(:action) { subject.new service }

    it 'returns an Adapter' do
      expect(action).to be_a(Headphones::Adapter)
    end
  end
end

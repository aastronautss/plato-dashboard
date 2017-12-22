# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ExternalService do
  describe 'validations' do
    it { should validate_presence_of(:type) }
    it { should validate_presence_of(:name) }
  end
end

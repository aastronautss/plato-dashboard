# frozen_string_literal: true

RSpec.describe Scrobble do
  describe 'validations' do
    it { should validate_presence_of(:type) }
    it { should validate_presence_of(:scrobbled_at) }
  end
end

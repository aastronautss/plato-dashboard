# frozen_string_literal: true

RSpec.describe Headphones::Artist do
  specify { expect(subject).to respond_to(:id) }
  specify { expect(subject).to respond_to(:name) }
  specify { expect(subject).to respond_to(:url) }
end

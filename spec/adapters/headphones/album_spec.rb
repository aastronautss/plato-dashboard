# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Headphones::Album do
  specify { expect(subject).to respond_to(:id) }
  specify { expect(subject).to respond_to(:title) }
  specify { expect(subject).to respond_to(:status) }
end

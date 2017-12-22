# frozen_string_literal: true

require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!

  config.filter_sensitive_data('<HOST>') { ENV['HEADPHONES_HOST'] }
  config.filter_sensitive_data('<PORT>') { ENV['HEADPHONES_PORT'] }
  config.filter_sensitive_data('HTTP_ROOT') { ENV['HEADPHONES_HTTP_ROOT'] }
  config.filter_sensitive_data('<API_KEY>') { ENV['HEADPHONES_API_KEY'] }
end
# frozen_string_literal: true

require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = 'spec/cassettes'
  config.hook_into :webmock
  config.configure_rspec_metadata!

  config.filter_sensitive_data('<APP_ID>') { ENV['FACEBOOK_APP_ID'] }
  config.filter_sensitive_data('<APP_SECRET>') { ENV['FACEBOOK_APP_SECRET'] }
  config.filter_sensitive_data('<APP_TOKEN>') { ENV['FACEBOOK_APP_ACCESS_TOKEN'] }
  config.filter_sensitive_data('<ACCESS_TOKEN>') { ENV['FACEBOOK_DUMMY_ACCESS_TOKEN'] }

  config.filter_sensitive_data('<HOST>') { ENV['HEADPHONES_HOST'] }
  config.filter_sensitive_data('<PORT>') { ENV['HEADPHONES_PORT'] }
  config.filter_sensitive_data('<HTTP_ROOT>') { ENV['HEADPHONES_HTTP_ROOT'] }
  config.filter_sensitive_data('<API_KEY>') { ENV['HEADPHONES_API_KEY'] }

  config.filter_sensitive_data('<API_KEY>') { ENV['LASTFM_API_KEY'] }
  config.filter_sensitive_data('<API_SECRET>') { ENV['LASTFM_API_SECRET'] }
  config.filter_sensitive_data('<TOKEN>') { ENV['LASTFM_DUMMY_TOKEN'] }
  config.filter_sensitive_data('~SESSION~') { ENV['LASTFM_DUMMY_SESSION'] }
  config.filter_sensitive_data('~USERNAME~') { ENV['LASTFM_DUMMY_USERNAME'] }

  config.filter_sensitive_data('<API_KEY>') { ENV['MOVES_API_KEY'] }
  config.filter_sensitive_data('<API_SECRET>') { ENV['MOVES_API_SECRET'] }
  config.filter_sensitive_data('<ACCESS_TOKEN>') { ENV['MOVES_DUMMY_ACCESS_TOKEN'] }
  config.filter_sensitive_data('<REFRESH_TOKEN>') { ENV['MOVES_DUMMY_REFRESH_TOKEN'] }
end

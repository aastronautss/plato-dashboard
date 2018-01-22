# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.4'

# Core
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'

# Front-end
gem 'haml'

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'

# Back-end
gem 'redis', '~> 4.0'
gem 'sidekiq', '~> 5.0'

gem 'activerecord_json_validator'
gem 'bcrypt', '~> 3.1.7'
gem 'hashie'
gem 'turbolinks', '~> 5'
gem 'upsert', '~> 2.2'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# API Gems
gem 'hphones-ruby', github: 'aastronautss/hphones-ruby', branch: 'master'
gem 'lastfm', github: 'aastronautss/lastfm-ruby', branch: 'master'
gem 'rdarr', github: 'aastronautss/rdarr-ruby', branch: 'master'
gem 'snarr', github: 'aastronautss/snarr-ruby', branch: 'master'

group :development, :test do
  gem 'rspec-rails'

  gem 'factory_bot_rails'

  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'

  gem 'dotenv-rails'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'web-console', '>= 3.3.0'

  gem 'rubocop'
end

group :test do
  gem 'simplecov'

  gem 'rails-controller-testing'
  gem 'shoulda-matchers'
  gem 'vcr'
  gem 'webmock'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

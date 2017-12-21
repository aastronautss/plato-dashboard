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
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'webpacker'
# gem 'therubyracer', platforms: :ruby

# Back-end
gem 'activerecord_json_validator'
gem 'bcrypt', '~> 3.1.7'
gem 'hashie'
gem 'redis', '~> 3.0'
gem 'turbolinks', '~> 5'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# API Gems
gem 'hphones-ruby', github: 'aastronautss/hphones-ruby', branch: 'master'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'dotenv-rails'
  gem 'pry-rails'
  gem 'rspec-rails'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'simplecov'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

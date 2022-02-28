# frozen_string_literal: true

source "https://rubygems.org"

# gem "rails"

ruby '3.0.0'
group :test do
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end
group :development, :test do
  gem 'rubocop', '1.20'
end

gem 'sinatra'
gem 'rack'
gem 'capybara', group: :test
gem 'webrick'
gem 'sinatra-contrib'
gem 'launchy'
gem 'pg'
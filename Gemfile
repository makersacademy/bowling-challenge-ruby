# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.0.0'

gem 'capybara'
gem 'pg'
gem 'sinatra'
gem 'sinatra-contrib'
gem 'sinatra-flash'
gem 'webrick'

group :test do
  gem 'rspec'
  gem 'simplecov', require: false
  gem 'simplecov-console', require: false
end

group :development, :test do
  gem 'rubocop', '1.20'
end

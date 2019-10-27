# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'faker', '~> 2.6.0'
gem 'elasticsearch-model', '~> 7.0.0'
gem 'elasticsearch-rails', '~> 7.0.0'
gem 'carrierwave', '~> 1.3.1'
gem 'euterpe', path: '/Users/myosis/Documents/euterpe'
gem 'pg_search', '~> 2.3.0'
gem 'redis', '~> 4.1.2'
gem 'activeadmin', '~> 2.2.0'
gem 'cancancan', '~> 3.0.1'
gem 'rails-i18n', '~> 5.1'
gem 'sendgrid-ruby', '~> 6.0.0'
# Auth
gem 'devise', '~> 4.0'
gem 'omniauth', '~> 1.9.0'
gem 'omniauth-facebook', '~> 5.0.0'
gem 'omniauth-google', '~> 1.0.2'
gem 'omniauth-twitter', '~> 1.4.0'
gem 'figaro', '~> 1.1.1'
gem 'jquery-rails', '~> 4.3.5'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use sqlite3 as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
# Bootstrap
gem 'bootstrap', '~> 4.3.1'
# gem 'bootstrap-sass', '~> 3.4.1'

gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the codeto stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'pry', '~> 0.12.2'
  gem 'pry-byebug', '~> 3.7.0'
  gem 'pry-rails', '~> 0.3.9'
  gem 'rubocop', '~> 0.73.0', require: false
  gem 'better_errors', '~> 2.5.1'
  gem 'rspec-rails', '~> 3.8.2'
  gem 'capybara', '~> 3.28.0'
  gem 'selenium-webdriver', '~> 3.142.3'
  gem 'geckodriver-helper', '~> 0.24.0'
  gem 'factory_bot_rails', '~> 5.0.2'
  gem 'rails-controller-testing'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '~> 2.1.0'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  # Easy installation and use of chromedriver to run system tests with Chrome
end

group :production do
 gem 'rails_12factor', '~> 0.0.3'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

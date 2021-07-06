source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'bundler', '~> 2.0'

#############################################################################
# Core

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '~> 1.7', require: false

# Use Puma as the app server
gem 'puma', '~> 5.3'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

#############################################################################
# Storage

# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

#############################################################################
# Security

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'devise'

gem 'cancancan', '~> 3.3'

#############################################################################
# Presentation

# Use SLIM
gem "slim-rails"

# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 6'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.4'

gem "bootstrap_form", "~> 4.5"
gem 'devise-bootstrap-form', '<= 0.4.0'

#############################################################################
# Service APIs

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.11'

#############################################################################
# Development/testing

group :development do
  gem 'listen', '>= 3.0.5', '< 3.6'
  # IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  # https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  # Activate rails_panel
  gem 'meta_request'
end

group :development, :test do
  # Load environment variables from .env
  gem 'dotenv-rails'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'nullalign'
end

#############################################################################
# Testing

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
  # gem 'chromedriver-helper' # Install to use Chrome in feature specs
  gem 'database_cleaner'
  gem 'factory_bot_rails'
  gem 'fuubar'
  gem "rspec-rails"
  gem "rspec_junit_formatter"
end

#############################################################################
# Tools

group :development do
  gem "html2slim", require: false
  gem "overcommit", require: false
  gem "rails_best_practices", require: false
  gem "reek", require: false
  gem "rubocop", '~> 1.18.3', require: false
  gem "rubocop-rails", require: false
end

#############################################################################
# Resources / assets

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# but we do not target Windows at the moment
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

#############################################################################

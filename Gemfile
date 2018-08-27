source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
# Use postgreSQL as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
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
gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# Flexible authentication solution for Rails.
gem 'devise'

# OmniAuth is a flexible authentication system utilizing Rack middleware. https://github.com/omniauth/omniauth
gem 'omniauth'

# Facebook OAuth2 Strategy for OmniAuth. https://github.com/mkdynamic/omniauth-facebook
gem 'omniauth-facebook'
gem 'omniauth-twitter'

# the font-awesome font bundled as an asset for the rails asset pipeline. https://github.com/bokmann/font-awesome-rails
gem 'font-awesome-rails'

# Turbo-charged counter caches
gem 'counter_culture'

# The administration framework
gem 'activeadmin'

# Integrates Bulma with the rails asset pipeline.
gem 'bulma-rails'

# Easily include static pages in your Rails app. http://thoughtbot.github.io/high_voltage
gem 'high_voltage'

#  A Scope & Engine based, clean, powerful, customizable and sophisticated paginator for Ruby webapps. https://github.com/kaminari/kaminari
gem 'kaminari'

gem 'jquery-rails'

# ReCaptcha helpers for ruby apps http://github.com/ambethia/recaptcha
gem 'recaptcha'

# Object-based searching.
gem 'ransack'

# Classier solution for file uploads for Rails, Sinatra and other Ruby web frameworks https://github.com/carrierwaveuploader/carrierwave
gem 'carrierwave'
gem 'rmagick', require: 'rmagick'

# Simple, efficient background processing for Ruby http://sidekiq.org
gem 'sidekiq'

# Classy web-development dressed in a DSL (official / canonical repo) http://www.sinatrarb.com/
gem 'sinatra'

# AWS SDK for JavaScript in the browser and Node.js http://aws.amazon.com/javascript
gem 'aws-sdk'

# The Ruby cloud services library. http://fog.io
gem 'fog'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
  gem 'seed-fu'
  gem 'factory_bot_rails'
  gem 'database_cleaner'
  gem 'pry-rails'
  gem 'faker'
  gem 'rails-controller-testing'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'better_errors'
  gem 'rubocop-rails'
  gem 'annotate'
  gem 'overcommit'
  gem 'bullet'
  # Retrieve the binding of a method's caller in MRI 1.9.2+. https://github.com/banister/binding_of_caller
  gem 'binding_of_caller'
  # Preview mail in the browser instead of sending. https://github.com/ryanb/letter_opener
  gem 'letter_opener'
  # A web interface for browsing Ruby on Rails sent emails:  https://github.com/fgrehm/letter_opener_web
  gem 'letter_opener_web'
  # Remote multi-server automation tool http://www.capistranorb.com
  gem 'capistrano'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano3-puma'
  gem 'capistrano-nginx'
  gem 'capistrano-sidekiq'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
  # Brings back `assigns` and `assert_template` to your Rails tests. https://github.com/rails/rails-controller-testing
  gem 'rails-controller-testing'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

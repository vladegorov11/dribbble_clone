source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.5'
# Use postgresql as the database for Active Record
gem 'pg', '>= 0.18', '< 2.0'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
#gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# css framework
gem "bulma-rails", "~> 0.6.1"
# Devise is a flexible authentication solution for Rails based on Warden
gem 'devise', '~> 4.3'
# This gem provides a simple and extremely flexible way to upload files from Ruby applications
gem 'carrierwave', '~> 1.2', '>= 1.2.1'
gem 'simple_form', '~> 3.5'
gem 'mini_magick'
gem 'impressionist', '~> 1.6'
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'gravatar_image_tag'
gem 'acts_as_votable', '~> 0.11.1'
gem 'russian', '~> 0.6.0'
gem 'will_paginate' , '~> 3.1.0'
gem 'pusher'
# Pundit provides a set of helpers
gem 'pundit'
gem 'file_validators'
# fog is the Ruby cloud services library
gem 'fog'
# js  framework
gem 'react-rails'
#gem nested form helper
gem 'nested_form'
#gem  Create beautiful JavaScript charts with one line of Ruby
gem 'chartkick'
#gem The simplest way to group by
gem 'groupdate'
# gem for notifications
gem 'notifications', '~> 0.6.0'
# Retrieving colors from an image
gem 'miro'
#  WYSIWYG editor
gem 'trix'
# postgresql search
gem 'pg_search'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'rspec-rails', '~> 3.7'
  gem "factory_bot_rails", "~> 4.0"
  gem 'faker', '~> 1.9', '>= 1.9.1'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

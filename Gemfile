source 'http://rubygems.org'

gem 'rails', '~> 5.0.0.beta1'

gem 'rabl-rails'

gem 'devise', github: 'plataformatec/devise'
gem "omniauth-google-oauth2"
gem 'rolify'
gem 'cancancan'

gem 'simple_form', '~> 3.2'
gem 'show_for'
gem 'validate_url'

gem 'will_paginate'
gem 'select2-rails'

gem 'sass-rails', '~> 5.0.0'
gem 'coffee-rails'

gem 'jquery-rails'

gem 'bootstrap-sass', '~> 3.3.0'
gem 'bootstrap-datepicker-rails'

gem 'fontello_rails_converter'

gem 'uglifier'

gem 'datejs-rails'

gem 'redcarpet'

gem 'inline_svg'

gem 'dotenv-rails'
gem 'oops', github: 'freerunningtech/oops'

gem 'slack-notifier'

gem 'rack-mini-profiler'
gem 'flamegraph'
gem 'stackprof'
gem 'memory_profiler'

group :development do
  gem 'quiet_assets'
  gem 'letter_opener'
end

group :development, :test do
  gem 'pry-rails'
  gem 'pry-byebug'
  gem 'ffaker'
  gem 'sqlite3'
end

group :test do
  gem 'capybara'
  gem 'minitest' # To get rid of errors
  gem 'shoulda-matchers'
  %w[rspec-core rspec-expectations rspec-mocks rspec-rails rspec-support].each do |lib|
    gem lib, :git => "https://github.com/rspec/#{lib}.git", :branch => 'master'
  end
  gem 'rspec-activemodel-mocks'
  gem 'rails-controller-testing', github: 'rails/rails-controller-testing'
  gem 'factory_girl_rails', require: false
  gem 'simplecov', require: false
  gem 'simplecov-rcov', require: false
  gem 'timecop'

  #gem 'konacha'
  #gem 'konacha-chai-matchers'
  gem 'ejs'
  gem 'poltergeist'
  gem 'webmock'
end

group :production do
  gem 'mysql2'
  gem 'exception_notification'
  gem 'unicorn'
end

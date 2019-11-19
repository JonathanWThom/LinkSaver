source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.6.3"

gem "airbrake"
gem "autoprefixer-rails"
gem "bootsnap"
gem "bourbon", "~> 5.0.0.beta.8"
gem "clearance"
gem "data_migrate"
gem "delayed_job_active_record"
gem "dotenv"
gem "flutie"
gem "font-awesome-rails"
gem "high_voltage"
gem "honeybadger"
gem "jquery-rails"
gem "jwt"
gem "kaminari"
gem "neat", "~> 2.1"
gem "pdf-reader"
gem "pg"
gem "puma"
gem "rack-canonical-host"
gem "rails", "~> 5.2.2"
gem "readingtime"
gem "recipient_interceptor"
gem "sass-rails", "~> 5.0"
gem "sendgrid-ruby"
gem "sidekiq"
gem "simple_form"
gem "skylight"
gem "slim"
gem "sorbet-rails"
gem "sorbet-runtime"
gem "sprockets", ">= 3.0.0"
gem "suspenders"
gem "title"
gem "uglifier"
gem "validate_url"

group :development do
  gem "letter_opener"
  gem "listen"
  gem "rack-mini-profiler", require: false
  gem "rails_real_favicon"
  gem "sorbet"
  gem "spring"
  gem "spring-commands-rspec"
  gem "web-console"
end

group :development, :test do
  gem "awesome_print"
  gem "bullet"
  gem "bundler-audit", ">= 0.5.0", require: false
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "pry-byebug"
  gem "pry-rails"
  gem "refills"
  gem "rb-readline"
  gem "rspec-rails", "~> 3.6"
end

group :test do
  gem "capybara-webkit"
  gem "database_cleaner"
  gem "formulaic"
  gem 'faker', :git => 'https://github.com/stympy/faker.git', :branch => 'master'
  gem "launchy"
  gem "rails-controller-testing"
  gem "shoulda-matchers"
  gem "simplecov", require: false
  gem "sinatra"
  gem "timecop"
  gem "webmock"
end

group :production do
  gem "rack-timeout"
  gem "newrelic_rpm"
end

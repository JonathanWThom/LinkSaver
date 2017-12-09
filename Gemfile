source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.4.1"

gem "autoprefixer-rails"
gem "clearance"
gem "delayed_job_active_record"
gem "flutie"
gem "honeybadger"
gem "jquery-rails"
gem "jwt"
gem "kaminari"
gem "pdf-reader"
gem "pg"
gem "puma"
gem "rack-canonical-host"
gem "rails", "~> 5.1.3"
gem "readingtime"
gem "recipient_interceptor"
gem "sass-rails", "~> 5.0"
gem "sidekiq"
gem "simple_form"
gem "skylight"
gem "slim"
gem "sprockets", ">= 3.0.0"
gem "suspenders"
gem "title"
gem "uglifier"
gem "validate_url"

group :development do
  gem "listen"
  gem "rack-mini-profiler", require: false
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
end

gem 'high_voltage'
gem 'bourbon', '~> 5.0.0.beta.8'
gem 'neat', '~> 2.1'
gem 'refills', group: [:development, :test]

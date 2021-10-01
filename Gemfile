source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.7.4"

gem "airbrake"
gem "attr_encrypted"
gem "bootsnap"
gem "bourbon", "~> 5.0.0.beta.8"
gem "clearance"
gem "data_migrate"
gem "dotenv"
gem "font-awesome-rails"
gem "flutie"
gem "high_voltage"
gem "jquery-rails"
gem "kaminari"
gem "mailgun_rails"
gem "neat", "~> 2.1"
gem "honeycomb-beeline"
gem "pdf-reader"
gem "pg"
gem "puma"
gem "rack-canonical-host"
gem "rails", "~> 6.0.4.1"
gem "readingtime"
gem "ruby-readability", require: "readability"
gem "sass-rails", "~> 5.0"
gem "sidekiq"
gem "simple_form"
gem "slim"
gem "sprockets", ">= 3.0.0"
gem "title"
gem "uglifier"
gem "validate_url"

group :development do
  gem "letter_opener"
  gem "listen"
  gem "rack-mini-profiler", require: false
  gem "spring"
  gem "spring-commands-rspec"
end

group :development, :test do
  gem "awesome_print"
  gem "bundler-audit", ">= 0.5.0", require: false
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rb-readline"
  gem "rspec-rails"
end

group :test do
  gem "webdrivers"
  gem "database_cleaner"
  gem "formulaic"
  gem "faker", git: "https://github.com/stympy/faker.git"
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

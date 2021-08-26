web: bundle exec puma -p $PORT -C ./config/puma.rb
worker: bundle exec sidekiq
release: bundle exec rake db:migrate

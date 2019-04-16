web: bundle exec puma -C config/puma.rb
release: rake db:migrate:reset RAILS_ENV=production DISABLE_DATABASE_ENVIRONMENT_CHECK=1

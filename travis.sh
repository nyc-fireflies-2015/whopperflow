bundle exec rake db:create 
bundle exec rake db:migrate
bundle exec rake db:create RAILS_ENV=test
bundle exec rake db:schema:load RAILS_ENV=test

#!/bin/bash
chown -R app:app /home/app/webapp
cd /home/app/webapp

sudo -u app bundle install --deployment --without development test
sudo -u app RAILS_ENV=production bundle exec rake assets:precompile 

bundle exec rake db:migrate
bundle exec rake db:migrate:status

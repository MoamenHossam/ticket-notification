# README

* Description
    system notification system that send due date reminders emails to the users based on their profile
    configuration

* Ruby version 3.3.6
* Rails version 8

* System dependencies
    redis server on port 6379 (can be changed in sidekiq.yml)

* Database creation
    postgres on port 5432
    postgres username: postgress (can be changed in database.yml)
    postgress password: 12345 (can be changed in database.yml)
    


* Deployment instructions
    bundle install
    run redis server on port 6379
    bundle exec sidekiq
    rails db:migrate
    rake db:seed


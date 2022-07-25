# Prefferences

- Ruby 2.7.2 (Rails 7.0+)
- PostgreSQL 9.3+

## Local deployment
- Install system dependencies
- Ask master.key and add it to 'config' folder
- Setup new user via posgres (See Setup PostgreSQL users for development)
- Run `bundle exec rails db:create` to create a new database (could be replaced with `bundle exec rails db:setup`)
- Run `bundle exec rails db:migrate` to run all the migrations (could be replaced with `bundle exec rails db:setup`)
- Run `bundle install` to setup all the needed gems
- Run `rails s` to run the appliction

## Setup PostgreSQL users for development/test

- Run `psql postgres`
- Create database with name of your user (listed as db.username in Rails credentials);
    - `create database usr;`
- Create user
    - `create usr digi with encrypted password 'YOUR PASWORD';`
- Add ability to manage databases to created user
    - `ALTER USER digi CREATEDB;`
- Add user and password to credentials.yml.enc
  - `EDITOR='code --wait' rails credentials:edit`
  - database_user: usr
  - database_password: password
- Add information from credentials to 'config/database.yml'
  - user: <%= Rails.application.credentials.database_user %>
  - password: <%= Rails.application.credentials.database_password %>

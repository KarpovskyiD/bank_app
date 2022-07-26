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
- Create database with name of your user;
    - `create database db;`
- Create user
    - `create usr user_name with encrypted password 'YOUR PASWORD';`
- Add ability to manage databases to created user
    - `ALTER USER user_name CREATEDB;`
- Add user and password to credentials.yml.enc
  - `EDITOR='code --wait' rails credentials:edit`
  - database_user: usr
  - database_password: password
- Change name of file '.env_example' to '.env' and set your credentials
  - DATABASE_USER=user
  - DATABASE_PASSWORD=password
  
1. Open initial page and sign up to create an account
<img width="1437" alt="Screenshot 2022-07-26 at 16 15 47" src="https://user-images.githubusercontent.com/75612479/181015849-a8ef30ef-7a82-4dd6-812d-91c928f737e0.png">
2. If you've already created an account press 'Log in' button
<img width="1440" alt="Screenshot 2022-07-26 at 16 15 58" src="https://user-images.githubusercontent.com/75612479/181015907-585db32b-ae62-4d7a-89ef-c11304541030.png">
3. After logging you see two buttons 'Create new transaction', 'History of transactions' and transactions history list
<img width="1440" alt="Screenshot 2022-07-26 at 16 16 11" src="https://user-images.githubusercontent.com/75612479/181016095-d06b8b42-ae0b-4dc8-b525-02f7b33a566a.png">
4. Click 'Create new transaction' button. Transaction form appears
<img width="1440" alt="Screenshot 2022-07-25 at 18 06 00" src="https://user-images.githubusercontent.com/75612479/180979647-64b0ab69-ab51-4b1d-b4bc-cff088d1554a.png">
5. Fill needed fields and press 'Create' button. If validation pass - new transaction is added.
<img width="1440" alt="Screenshot 2022-07-26 at 16 16 24" src="https://user-images.githubusercontent.com/75612479/181017200-b22ff0f0-5033-4cd6-88d2-d2ca511dcd9b.png">
6. After that page with transactions history is shown
<img width="1097" alt="Screenshot 2022-07-26 at 13 23 16" src="https://user-images.githubusercontent.com/75612479/180984387-b98f34eb-94ba-4aec-8d4d-02b31230c29e.png">

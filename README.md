## README
## Getting Started

  This README would normally document whatever steps are necessary to 
  get the application up and running.

## Prerequisites

  What things you need to install the software and how to install them
### Ruby

Ruby version for this project is ` 3.1.2`.
rvm is our recommended and preferred ruby version management software. If you don't have rvm installed on your system.
For installing the ruby version, type in the following command on your terminal ``` rvm install ruby-3.1.2```.

One can check the installed ruby version by the following command ``` rvm list```.

The output should be something like this ``` =* ruby-3.1.2 [ x86_64 ]```.

### Rails
Rails version for this project is ` 7.0.4`.

### Postgres

Our preferred database managing software is Postgres. If not installed, one can look into their official documentation [here](https://www.postgresql.org/download) and follow the steps as given.

For set Postgres User ` sudo -u postgres psql` and set postgres user for database(DB) and write username and password into database.yml

To setup psql db role one can go to the psql console by the following command and create role respectively.

psql postgres
create role postgres with createdb dropdb superuser login password 'postgres';

### Project Dependencies

To setup the project, follow the below commands in the project directory.

` bundle install`

This will install all the required gems for the project on your system.

### Create Database

To create database in your system.

` rails db:create`.

### Run Migrations

For run migartions

` rails db:migrate`.

### Run Seed

For run seed

` rails db:seed`.

### Run Server

` rails s`.

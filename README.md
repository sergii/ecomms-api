# Ecomms - simple E-commerce type API web application (Ecomms API)
[![Build Status](https://travis-ci.org/sergii/ecomms.svg?branch=master)](https://travis-ci.org/sergii/ecomms)

Backend build with rails-api, frontend with React.

## Dependecies

ruby-2.4.2
rails 5.1.4 (api mode)
postgresql 10.0

For using curb gem we should install native dependencies
`$ sudo apt-get install libcurl4-openssl-dev`

## Database initialization

```
$ psql -c 'create database ecomms_test;' -U postgres
```

## Setup and database creation

Check out this repository and then:

```
$ bundle install
$ bundle exec rails db:setup db:migrate db:seed
$ bundle exec rails server
```

## How to run the test suite

`$ bundle exec rspec`

## Services (job queues, cache servers, search engines, etc.)

Not for now.

## Built With

* [Rails](https://github.com/rails/rails) - The web framework used in "api" mode.
* [React](https://reactjs.org/) - Used to build client interface.
* [PostgreSQL](https://www.postgresql.org/) - Used to build object-relational database system.
* [RSpec](http://rspec.info/) - Making TDD Productive and Fun.

## Deployment instructions

To deploy on heroku feel free install:

```
$ heroku login # => Enter your Heroku credentials
$ heroku create
$ git push heroku master
$ heroku run rake db:migrate
$ heroku open
```

## Demo

https://ecomms.herokuapp.com - Link to working application

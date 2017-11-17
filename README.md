# Ecomms - simple E-commerce type API web application (Ecomms API)
[![Build Status](https://travis-ci.org/sergii/ecomms-api.svg?branch=master)](https://travis-ci.org/sergii/ecomms-api)
[![Coverage Status](https://coveralls.io/repos/github/sergii/ecomms-api/badge.svg?branch=feature%2Fcoveralls)](https://coveralls.io/github/sergii/ecomms-api?branch=feature%2Fcoveralls)
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fsergii%2Fecomms-api.svg?type=shield)](https://app.fossa.io/projects/git%2Bgithub.com%2Fsergii%2Fecomms-api?ref=badge_shield)

Backend build with rails-api, frontend with React.

Application has the following implemented features:

#### Customer Features
- [x] CF-1: Customers can sign up, using their email as username.
* After signing up, the user should receive a welcome email (does not need styling).
- [ ] CF-2: Customers can log in and out.
- [x] CF-3: Customers can view all products in a gridded view, no matter if they’re logged in or not.
- [x] CF-4: Each grid item displays the name of the product, the brand name, the model number and the price.
- See https://www.instagram.com/natgeo/ for an example of a gridded view (but without pictures).
- [ ] CF-5: Customers can click on a product to see details about it in a modal.
- [ ] CF-6: The modal has the same info as the grid view for each product, plus the provided description of the product.
- [ ] CF-7: Customers can add products to a cart.
- [ ] CF-8: "Add to cart" buttons should be on the modal for the product.
- [ ] CF-9: Customers can view their cart and the items inside.
- [ ] CF-10: Customers can delete an item from their cart.
- [ ] CF-11: Customers can buy all items on the cart.
* Use a "Buy" button on the cart page.
* Store this information on the database as an Order (products on the cart and customer).

#### Site Administrator Features
- [ ] SAF-1: Site administrators are able to login and out.
- [ ] SAF-2: There should be a default site administrator.
- [ ] SAF-3: Site administrators should be able to upload a JSON file with product descriptions.
* A JSON file with the products will be provided along this test. Please use this to create the products for the application.
- [ ] SAF-4: Site administrators can add products.
- [ ] DAF-5: Site administrators can list existing customers (customer users).

#### API User Features
- The site should provide a (possibly RESTful) API with the following features:
- [x] APIF-1: An endpoint to list all products.
- [x] APIF-2: An endpoint to list a product given it's ID.
- [x] APIF-3: An endpoint to create a product.
- [x] APIF-4: An endpoint to update the price of a product.
- [x] APIF-5: Querying the API should only be possible if an authentication token is provided as part of the request's header.
- [x] APIF-6: Appropriate success and error status codes and messages should be returned for each endpoint.
- [x] APIF-7: All api requests and responses should use JSON format.

#### Database Tasks
- [ ] DBT-1: Configure the Rails application to dump the database schema to an sql file.
- [ ] DBT-2: Create a database view to display the number of orders a customer has (customer email, number of orders placed).

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

https://github.com/sergii/ecomms-api source code

https://ecomms-api.herokuapp.com - Link to working API application


## License
[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2Fsergii%2Fecomms-api.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2Fsergii%2Fecomms-api?ref=badge_large)
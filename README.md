## Backend-test

Rails API to save Complaints and get back summaries, not includ Users Validations, Update records and Destroy.


## Technology 

Technologies used in this project.

* Ruby version  2.7.2
* Rails version 6.1.3.1
* PostgreSQL version 12.6
* Puma version 5.2.2
* Rspec version 3.10
* Docker version 20.10.5
* Docker-compose version 1.26.0


## Services Used

* Github
* Postman
* Heroku


## Ruby Gems
rails, pg, puma, bootsnap, byebug, rspec-rails, ffaker, factory_bot_rails, listen, tzinfo-data


## Getting started

* To install gems:
>    $ bundle install
* To create the bank and do as migrations:
>    $ rake db:create db:migrate db:seed
* To run the project local:
>    $ rails s


## Strategy to Deploy

* To generate Container image:
>    $ docker build -t rails-docker .
* To generate Container-compose orchestration:
>    $ docker-compose -f docker-compose.yml up --build
* To create the bank and do as migrations:
>    $ docker-compose run web rails db:create
>    $ docker-compose run web rails db:migrate
>    $ docker-compose run web rails db:seed
* To run the project using Container image:
>    $ docker-compose up


## How to use

* POST - Complain Create
> http://localhost:3000/api/v1/complains?Content-Type=application/json

HEADERS
> Content-Type: application/json

PARAMS
> Content-Type: application/json

BODY (all fields required)
>{
	"title": "",
	"description": "",
	"city": "",
	"state": "",
	"country": "",
	"company": ""
}

EXAMPLE
>curl --location --request POST 'http://localhost:3000/api/v1/complains?Content-Type=application/json' \
>--header 'Content-Type: application/json' \
>--data-raw '{
>	"title": "test title 2",
>	"description": "test description 2",
>	"city": "test city 1",
>	"state": "test state 2",
>	"country": "test country 2",
>	"company": "test company 2"
>}'


* GET - Filter City and/or Company
> http://localhost:3000/api/v1/complains/?city=test city 1&company=test company 1

Returns the number of Complains, filtering the result by City and Company

HEADERS
> Content-Type: application/json

PARAMS (not required)
> city and/or company
 
EXAMPLES
>curl --location --request GET 'http://localhost:3000/api/v1/complains/?city=test%20city%201&company=test%20company%201' \
>--header 'Content-Type: application/json'

>curl --location --request GET 'http://localhost:3000/api/v1/complains/?city=test%20city%202' \
>--header 'Content-Type: application/json'

>curl --location --request GET 'http://localhost:3000/api/v1/complains/?company=test%20company%201' \
>--header 'Content-Type: application/json'


## TESTS

* To run Unit Tests
>    $ bundle exec rspec spec/models/complain_spec.rb
* To run Integration Tests
>    $ bundle exec rspec spec/requests/complains_spec.rb


## Features

  - Clean Code using Rails API only functions
  - Tested by Rspec and Ffaker data generator
  - Code maked using Microservice Design and deploy strategies, with the implementation of Containers using Docker Images  and the orchestration using Docker-Compose
  - Documentation and access routines on Postman
  - API published on Heroku Cloud Platform, allowing access without installation
  - Development steps with Git history
  - Addtioned to github


## Links

  - Link of deployed application on Heroku: https://backend-test-2021.herokuapp.com/
  - Repository: https://github.com/JAGUIARINFO/backend-test/
  - Postman Documentation: https://documenter.getpostman.com/view/13602059/TzJsexaz


## Author

* **JULIO ALBERTO AGUIAR*: @JAGUIARINFO (https://github.com/JAGUIARINFO)

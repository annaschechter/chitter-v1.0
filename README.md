Chitter
======================
Chitter is the week four, individual challenge at Makers Academy. This challenge is testing students' undestanding of Sinatra sessions and skills of using a relational database.
Specification
-------------
Chitter is a mini Twitter clone that allows users to post messages to a public stream.
You can see the working version of it here: https://annas-gossip-chitter.herokuapp.com/

Chitter has the following functionality:
* users can sign up for the service
* users can log in and log out
* users can post messages to chitter
* users can see all posts in chronological order
* users can reply to the posts

Languages and Tools
-------------------
* Ruby
* Sinatra
* PostgreSQL
* RSpec
* Capybara

How to use
----------
Clone the repository:
```
$ git clone git@github.com:annaschechter/chitter-v1.0.git
```
Install the gems:
```
$ bundle install
```
Create test and development databases:
```
$ psql
# create database chitter-v1.0_test;
# create database chitter-v1.0_development;
```
Run RSpec to see the unit tests:
```
$ rspec
```
Rackup:
```
$ rackup
```
In your browser visit http://localhost:9292/
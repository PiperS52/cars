# Cars and colours

## Getting started
Clone this repository:
```
$ git clone https://github.com/PiperS52/cars
```
Install relevant dependencies, as well as create and seed databases:
```
$ bundle install
$ bin/rails db:create     #or rake db:create
$ bin/rails db:migrate    #or rake db:migrate
$ bin/rails db:seed       #or rake db:seed
```
Start the server:
```
$ rails s         #visit http://localhost:3000
```
Run the tests from the root folder:
```
$ rspec                   #or bundle exec rspec
```


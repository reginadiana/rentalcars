<h1 align="center">Rental Cars</h1>

## Table of contents

- [Description](#description-checkered_flag)
- [How to run](#how-to-run)
  - [Technologies and your Versions](#technologies-and-your-versions)
  - [System dependencies](#system-dependencies-package)
- [Database](#database-floppy_disk)
  - [CRUD](#crud)
  - [Database creation](#database-creation)
  - [Database initialization](#database-initialization)
- [How to run the test suite](#how-to-run-the-test-suite-memo)

## Description :checkered_flag:

An application backend with Ruby on Rails for rental cars. The customers can register itself and choice a model car. 

## How to run :arrow_forward:

### Technologies and your Versions

Ruby 2.6.3
```
$ ruby -v 
```

Ruby on Rails  6.0.2.2
```
$ rails -v 
```

Node 12.16.2
```
$ node -v
```

Gem 3.1.2
```
$ gem -v 
``` 

Bundle 2.1.2
```
$ bundle -v
```

Yarn 1.22.4
```
$ yarn -v
```

### System dependencies :package:

For install dependencies of this project, do you need to have this [Gemfile](https://github.com/Diana-ops/rental-cars-treina-dev-1/blob/master/Gemfile). Before, run in prompt:

```
$ bundle install or bin/setup
```

### Database initialization

```
$ rails db:migrate
```

### Run in server 

> For to see the application in localhost, run this commands and acess http://localhost:3000

```
$ rails server or rails r
```

### How to run the test suite :memo:

```
$ cd rental_cars
$ rspec 
```

## Database :floppy_disk:

### CRUD

Each function of CRUD was made using the routes of rails to:

#### Manufacturers Routes

| Preflix  |  Verb  | URI Pattern | Controller#Action |
| ------------------- | ------------------- | ------------------- | ------------------- |
|  manufacturers |  GET | /manufacturers(.:format) | manufacturers#index |
|   |  POST | /manufacturers(.:format) | manufacturers#create |
|  new_manufacturer |  GET | /manufacturers/new(.:format) | manufacturers#new |
|  edit_manufacturer |  GET | /manufacturers/:id/edit(.:format) | manufacturers#edit |
|  manufacturer |  GET | /manufacturers/:id(.:format) | manufacturers#show |
|   |  PATCH | /manufacturers/:id(.:format) | manufacturers#update |
|   |  PUT | /manufacturers/:id(.:format) | manufacturers#update |
|   |  DELETE | /manufacturers/:id(.:format) | manufacturers#destroy |

#### Car Category Routes

#### Car Model Routes

#### Subsidiary Routes

#### Custumer Routes

## Licence :trident:

The MIT License (MIT)

Copyright :copyright: 2020 Rental Cars

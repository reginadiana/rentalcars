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

|  manufacturer | Type |
| ------------------- | ------------------- |
|  name |  string |
|  id_manufacturer |  integrer |

|  car_category | Type |
| ------------------- | ------------------- |
|  name |  string |
|  daily_rate |  string |
|  car_insurance |  string |
|  third_party_insurance |  string |
|  id_car_category |  integrer |

|  car_model | Type |
| ------------------- | ------------------- |
|  name |  string |
|  year |  integrer |
|  **manufacturer** |  **object** |
|  motorization |  string |
|  **car_category** |   **object** |
|  fuel_type | string |
|  id_car_model |  integrer |
|  id_manufacturer |  integrer |
|  id_car_category |  integrer |

|  subsidiary | Type |
| ------------------- | ------------------- |
|  name |  string |
|  CNPJ |  string |
|  address |  string |
|  id_subsidiary |  integrer |

|  customer | Type |
| ------------------- | ------------------- |
|  name |  string |
|  CPF |  string |
|  email |  string |
|  id_customer |  integrer |

### CRUD

Each function of CRUD was made using the routes of rails to:

For to see this routes in prompt, run: 

```
$ rails routes -g <name of controller>
```

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

| Preflix  |  Verb  | URI Pattern | Controller#Action |
| ------------------- | ------------------- | ------------------- | ------------------- |
|  car_categories |  GET | /car_categories(.:format) | car_categories#index |
|   |  POST | /car_categories(.:format) | car_categories#create |
|  new_car_category |  GET | /car_categories/new(.:format) | car_categories#new |
|  edit_car_category |  GET | /car_categories/:id/edit(.:format) | car_categories#edit |
|  car_category |  GET | /car_categories/:id(.:format) | car_categories#show |
|   |  PATCH | /car_categories/:id(.:format) | car_categories#update |
|   |  PUT | /car_categories/:id(.:format) | car_categories#update |
|   |  DELETE | /car_categories/:id(.:format) | car_categories#destroy |

#### Car Model Routes

| Preflix  |  Verb  | URI Pattern | Controller#Action |
| ------------------- | ------------------- | ------------------- | ------------------- |
|  car_models |  GET | /car_models(.:format) | car_models#index |
|   |  POST | /car_models(.:format) | car_models#create |
|  new_car_model |  GET | /car_models/new(.:format) | car_models#new |
|  edit_car_model|  GET | /car_models/:id/edit(.:format) | car_models#edit |
|  car_model |  GET | /car_models/:id(.:format) | car_models#show |
|   |  PATCH | /car_models/:id(.:format) | car_models#update |
|   |  PUT | /car_models/:id(.:format) | car_models#update |
|   |  DELETE | /car_models/:id(.:format) | car_models#destroy |

#### Subsidiary Routes

| Preflix  |  Verb  | URI Pattern | Controller#Action |
| ------------------- | ------------------- | ------------------- | ------------------- |
|  subsidiaries |  GET | /subsidiaries(.:format) | subsidiaries#index |
|   |  POST | /subsidiaries(.:format) | subsidiaries#create |
|  new_subsidiary |  GET | /subsidiaries/new(.:format) | subsidiaries#new |
|  edit_subsidiary |  GET | /subsidiaries/:id/edit(.:format) | subsidiaries#edit |
|  car_subsidiary |  GET | /subsidiaries/:id(.:format) | subsidiaries#show |
|   |  PATCH | /subsidiaries/:id(.:format) | subsidiaries#update |
|   |  PUT | /subsidiaries/:id(.:format) | subsidiaries#update |
|   |  DELETE | /subsidiaries/:id(.:format) | subsidiaries#destroy |

#### Custumer Routes

| Preflix  |  Verb  | URI Pattern | Controller#Action |
| ------------------- | ------------------- | ------------------- | ------------------- |
|  custumers |  GET | /custumers(.:format) | custumers#index |
|   |  POST | /custumers(.:format) | custumers#create |
|  new_custumer |  GET | /custumers/new(.:format) | custumers#new |
|  edit_custumer |  GET | /custumers/:id/edit(.:format) | custumers#edit |
|  car_custumer |  GET | /custumers/:id(.:format) | custumers#show |
|   |  PATCH | /custumers/:id(.:format) | custumers#update |
|   |  PUT | /custumers/:id(.:format) | custumers#update |
|   |  DELETE | /custumers/:id(.:format) | custumers#destroy |

## Licence :trident:

The MIT License (MIT)

Copyright :copyright: 2020 Rental Cars

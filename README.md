<h1 align="center">Rental Cars</h1>

## Table of contents

:small_orange_diamond: [Description](#description-checkered_flag)

:small_orange_diamond: [How to run](#how-to-run-arrow_forward)

&nbsp;&nbsp;&nbsp;&nbsp; :small_blue_diamond: [Technologies and your Versions](#technologies-and-your-versions)
  
&nbsp;&nbsp;&nbsp;&nbsp; :small_blue_diamond: [System dependencies](#system-dependencies-package)
  
&nbsp;&nbsp;&nbsp;&nbsp; :small_blue_diamond: [Database initialization](#database-initialization)
  
&nbsp;&nbsp;&nbsp;&nbsp; :small_blue_diamond: [Run in server](#run-in-server)
  
&nbsp;&nbsp;&nbsp;&nbsp; :small_blue_diamond: [How to run the test suite](#how-to-run-the-test-suite-memo)
  
:small_orange_diamond: [Database](#database-floppy_disk)

&nbsp;&nbsp;&nbsp;&nbsp; :small_blue_diamond: [CRUD](#crud)
  
&nbsp;&nbsp;&nbsp;&nbsp; :small_blue_diamond: [Database initialization](#database-initialization)
  
:small_orange_diamond: [Solving problems](#solving-problems)

:small_orange_diamond: [Licence](#licence-trident)

## Description :checkered_flag:

A backend application with Ruby on Rails for rental cars. The customers can register itself and choose a model car. 

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

For install dependencies of this project, you need to have this [Gemfile](https://github.com/Diana-ops/rental-cars-treina-dev-1/blob/master/Gemfile). Before, run in prompt:

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
$ rails server or rails s
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

|  car | Type |
| ------------------- | ------------------- |
|  license_plate |  string |
|  color |  string |
|  car_model |  **object** |
|  mileage |  integrer |
|  subsidiary |  **object** |
|  id_car |  integrer |
|  id_car_model |  integrer |
|  id_subsidiary |  integrer |

### CRUD

For each function of CRUD, we have a router for him:

For to see this routes in prompt, run: 

```
$ rails routes -g <name of controller>
```

## Solving problems

Go to my [issues](https://github.com/Diana-ops/treina-dev-turma-3/issues) for to see how I resolved some problems in development project.

## Licence :trident:

The MIT License (MIT)

Copyright :copyright: 2020 Rental Cars

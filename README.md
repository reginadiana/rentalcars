<p align="center">
  <img src="https://user-images.githubusercontent.com/46378210/81428957-76295000-9133-11ea-910a-ccbdf88e32ba.png" alt="Titulo do Projeto"/>
</p>

## Lista de Conteúdos

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
  
:small_orange_diamond: [Solving problems](#solving-problems-exclamation)

:small_orange_diamond: [Licence](#licence-trident)

## Descrição do Projeto :checkered_flag:

O projeto é uma aplicação backend com Ruby on Rails para um sistema interno de aluguel de carros. O administrador pode criar uma conta e agendar uma locação, escolhendo o modelo do carro, categoria, data de agendamento, etc. 

## Pré-requisitos 

Algumas instalações serão necessárias antes de iniciar o projeto. 

- [Ruby]() versão >=2.6.3
- [Ruby on Rails]() versão >=6.0.2.2
- [Node]() versão >=12.16.2
- [Gem]() versão >=3.1.2
- [Bundle]() versão >=2.1.2
- [Yarn]() versão >=1.22.4

Verifique se as libs foram instaldas e estão na versão correta executando no terminal:

```
$ <nome da lib em minusculo> -v 
```

## Configurações :arrow_forward:

1. Clone o projeto

2. Entre no diretório

3. Use a versão correta do Node

4. Check os arquivos 

5. Instale as dependencias 

6. Inicie o database 

7. Importe o database default da aplicação

### Instalando Dependencias :package:

For install dependencies of this project, you need to have this [Gemfile](https://github.com/Diana-ops/rental-cars-treina-dev-1/blob/master/Gemfile). Before, run in prompt:

```
$ bundle install or bin/setup
```
### Check files with yarn

```
$ yarn install --check-files
```
### Database initialization

```
$ rails db:migrate
```
### To use database default of application

```
$ rails db:reset
```

### Use this node version
```
$ nvm use node >=10.13.0
```
### Run in server 

> For to see the application in localhost, run this commands and acess http://localhost:3000

```
$ rails server or rails s
```

### How to run the test suite :memo:

```
$ cd rental_cars
$ rspec or bundle exec rspec
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

## Solving problems :exclamation:

Go to my [issues](https://github.com/Diana-ops/rental-cars-treina-dev-1/issues) for to see how I resolved some problems in development project.

## Licence :trident:

The MIT License (MIT)

Copyright :copyright: 2020 Rental Cars

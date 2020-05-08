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

## Pré-requisitos :package:

Algumas instalações serão necessárias antes de iniciar o projeto. 

:warning: [Ruby]() versão >=2.6.3

:warning: [Ruby on Rails]() versão >=6.0.2.2

:warning: [Node]() versão >=12.16.2

:warning: [Gem]() versão >=3.1.2

:warning: [Bundle]() versão >=2.1.2

:warning: [Yarn]() versão >=1.22.4

Verifique se as libs foram instaldas e estão na versão correta executando no terminal:

```
$ <nome da lib em minusculo> -v 
```

## Configurações :arrow_forward:

1. Clone o projeto

```
$ git clone https://github.com/Diana-ops/rental-cars-treina-dev-1
```

2. Entre no diretório

```
$ cd rental-cars-treina-dev-1
```
3. Use a versão correta do Node

```
$ nvm use node >=10.13.0
```

4. Check os arquivos 
```
$ yarn install --check-files
```

5. Instale as dependencias do arquivo [Gemfile](https://github.com/Diana-ops/rental-cars-treina-dev-1/blob/master/Gemfile)
```
$ bundle install or bin/setup
```

6. Inicie o database 
```
$ rails db:migrate
```

7. Importe o database default da aplicação
```
$ rails db:reset
```

## Rodando a aplicação

```
$ rails server or rails s
```

> Depois, acesse http://localhost:3000 para ver a aplicação


### Rodando os testes :memo:

```
$ cd rental-cars-treina-dev-1
$ rspec or bundle exec rspec
```

## Database :floppy_disk:

As tabelas do banco de dados podem ser vistas no arquivo [schema](https://github.com/Diana-ops/rental-cars-treina-dev-1/blob/master/db/schema.rb)

Os dados default foram criados em [seeds](https://github.com/Diana-ops/rental-cars-treina-dev-1/blob/master/db/seeds.rb)

## Rotas

Para ver as rotas disponíveis na aplicação, execute: 

```
$ rails routes -g <name of controller>
```

## Resolvendo Probleas :exclamation:

Em [issues](https://github.com/Diana-ops/rental-cars-treina-dev-1/issues) foram abertos alguns problemas gerados durante o desenvolvimento desse projeto e como foram resolvidos. 

## Licença :trident:

The [MIT License](https://github.com/Diana-ops/rental-cars-treina-dev-1/blob/master/LICENSE) (MIT)

Copyright :copyright: 2020 Rental Cars

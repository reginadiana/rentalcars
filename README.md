<p align="center">
  <img src="https://user-images.githubusercontent.com/46378210/81428957-76295000-9133-11ea-910a-ccbdf88e32ba.png" alt="Titulo do Projeto"/>
</p>

## Lista de Conteúdos

:small_orange_diamond: [Descrição do Projeto](#descrição-do-projeto-checkered_flag)

:small_orange_diamond: [Deploy](#deploy)

:small_orange_diamond: [Pré-requisitos](#pré-requisitos-package)

:small_orange_diamond: [Configurações](#configurações-arrow_forward)

:small_orange_diamond: [Rodando a aplicação](#rodando-a-aplicação)

:small_orange_diamond: [Rodando os testes](#rodando-os-testes-memo)

:small_orange_diamond: [Database](#database-floppy_disk)

:small_orange_diamond: [Rotas](#rotas)

:small_orange_diamond: [Resolvendo Problemas](#resolvendo-problemas-arrow-up)

:small_orange_diamond: [Licença](#licença-trident)

## Status do Projeto

> Em manutenção :warning:

## README em Ingles

[README](https://github.com/Diana-ops/rental-cars-treina-dev-1/blob/master/README-ENG.md)

## Descrição do Projeto :checkered_flag:

O projeto é uma aplicação backend com Ruby on Rails para um sistema interno de aluguel de carros. O administrador pode criar uma conta e agendar uma locação, escolhendo o modelo do carro, categoria, data de agendamento, etc. 

## Deploy 

## Pré-requisitos :package:

Algumas instalações serão necessárias antes de iniciar o projeto. 

:warning: [Ruby](https://www.ruby-lang.org/pt/documentation/installation/) versão >=3.1.2

:warning: [Ruby on Rails](https://guides.rubyonrails.org/getting_started.html) versão >=7.0.2

:warning: [Node](https://nodejs.org/en/download/) versão >=12.16.2

:warning: [Gem](https://rubygems.org/pages/download?locale=pt-BR) versão >=3.1.2

:warning: [Bundle](https://bundler.io/man/bundle-install.1.html) versão >=2.1.2

:warning: [Yarn](https://classic.yarnpkg.com/pt-BR/docs/install/#windows-stable) versão >=1.22.4

:warning: [Docker](https://docs.docker.com/engine/install/ubuntu/)

Verifique se as libs foram instaldas e estão na versão correta executando no terminal:

```
$ <nome da lib em minusculo> -v 
```

## Configurações :arrow_forward:

1. Clone o projeto

```
$ git clone https://github.com/reginadiana/rentalcars
```

2. Entre no diretório

```
$ cd rentalcars
```

3. Agora vamos rodar a aplicação com Docker:

`docker-compose build`

`docker-compose run --service-ports web bash`

Um novo terminal irá abrir, então, execute:

```
$ rails s -b 0.0.0.0
```

> Depois, acesse http://localhost:3000 para ver a aplicação


### Rodando os testes :memo:

```
$ cd rentalcars
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

## Permissions [:arrow_up:](#lista-de-conteúdos)


Em [issues](https://github.com/Diana-ops/rental-cars-treina-dev-1/issues) foram abertos alguns problemas gerados durante o desenvolvimento desse projeto e como foram resolvidos. 

## Licença :trident:

The [MIT License](https://github.com/Diana-ops/rental-cars-treina-dev-1/blob/master/LICENSE) (MIT)

Copyright :copyright: 2022 Rental Cars

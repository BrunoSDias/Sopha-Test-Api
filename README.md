# SOPHA TEST API


## Table of contents
* [General info](#general-info)
* [Requirements](#requirements)
* [How to configure](#how-to-configure)
* [How to run Rspec Tests](#how_to_run_rspec-tests)


## General info

A seguinte API é responsável por gerenciar um catálogo de lojas (Store) vinculadas e gerenciadas por um usuário (User).
\n
Desenvolvido por Juliano Rohde.

## Requirements

* Ruby 2.7.1 or docker and docker-compose
* PostgreSQL installed on the machine (if you choose local usage)
* Clone the repository: 'https://github.com/julianorohde/Sopha-Test-Api'

## How to configure

### Local usage

1. First step run 'bundle install'
2. Run 'rails db:setup' to automatically create and migrate the database
3. Run 'rails s' or 'rails server' to start the server located at 'http://localhost:3000'

### Docker

1. Install docker (https://docs.docker.com/get-docker/) and docker-compose (https://docs.docker.com/compose/install/)
2. Run 'docker-compose up -d --build'
3. Run 'docker exec -it rails-api bash'
4. Run 'rails db:setup' for install bundle and configure db

## How to run Rspec Tests

1. To run all tests, type 'rspec' into the console
2. To run controller tests, type 'rspec spec/controllers'
3. To run model tests, type 'rspec spec/models'

## How to test the API

### Requirements

* Install postman, insomnia or another application to test APIs

### User's test

#### To test the #create method of the User

```
Method: POST
URL: http://localhost:3000/signup
Body(raw/JSON):
{
  "user":{
    "email":"test@test.com",
    "password":"123456",
    "name":"Test"
  }
}
Authorization: none
```

```
Should return:
{
  "user":{
    "name":"juliano",
    "email":"juliano3@test.com"
  }
}
```

#### To test the #login method of the User
```
Method: POST
URL: http://localhost:3000/login/
Body (raw/JSON):
{
  "user":{
    "email":"test@test.com",
    "password":"123456"
  }
}
Authorization: none
```

```
Should return:
{
  "user":{
    "name":"test",
    "email":"test@test.com",
    "token":"eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI4NTljODc3Yi0zY2FiLTQ0Y2ItYWYzNy1kMWQ0YWJmYjQ4ODQiLCJzdWIiOiIyIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjk2NTMxNDU5LCJleHAiOjE2OTY1MzMyNTl9.wj9PqqDoczAqXNRriMPxWNpqSlgN-0PzV0_Oo8Vw8KQ"
  }
}
```

#### To test the #create method of the User

```
Method: DELETE
URL: http://localhost:3000/logout/
Body (raw/JSON): none
Authorization: <inserir o token que recebeu no login>
```

```
Should return: status 200
```

### Store's test

#### To test the #login method of the Store

```
Method: POST
URL: http://localhost:3000/stores/
Authorization: <inserir um token de usuário válido>
Body:
{
  "name":"Test Store API"
}
```

```
Should return: status 201

{
  "store":{
    "id":1,
    "name":"Test Store API"
  }
}
```

#### To test #index method of the Store

```
Method: GET
URL: http://localhost:3000/stores/
Authorization: <inserir um token de usuário válido>
Body: none
```

```
Should return: status 200

{
  "stores":[
    {
      "id":1,
      "name":"Test Store API"
    }
  ]
}
```

#### To test #show method of the Store
	
```
Method: GET
URL: http://localhost:3000/stores/:id
Authorization: <inserir um token de usuário válido>
Body: none
```

```
Should return: status 200 and the information of the store searched by id
```

#### To test #update method of the Store

```
Method: PUT or PATCH
URL: http://localhost:3000/stores/:id
Authorization: <inserir um token de usuário válido>
Body:
{
  "name":"Updated Test Store API 3.1"
}
```

```
Should return: status 200 and the updated Store
```
	
#### To test #destroy method of the Store

```
Method: DELETE
URL: http://localhost:3000/stores/:id
Authorization: <inserir um token de usuário válido>
Body: none
```

```
Should return: status 204
```

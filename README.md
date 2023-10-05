# SOPHA TEST API

A seguinte API é responsável por gerenciar um catálogo de lojas (Store) vinculadas e gerenciadas por um usuário (User).
A API pode ser executada localmente ou através da API hospedada na AWS EC2 <link>.
Desenvolvido por Juliano Rohde.

## Instalation

1. Requisitos:
	- Ruby 2.7.1 ou docker e docker-compose;
	- Clone o repositório: 'LINK AQUI'

## How to configure

# Local usage

1. Execute o servidor: 'rails server'
2. Execute 'rails db:setup' para instalar o bundle e configurar automaticamente o banco de dados


# Docker

1. Install docker (https://docs.docker.com/get-docker/) and docker-compose (https://docs.docker.com/compose/install/)
2. Run 'docker-compose up -d --build'
3. Run 'docker exec -it rails-api bash'
4. Run 'rails db:setup' for install bundle and configure db

## How to run Rspec Tests (local or docker)

1. Para rodar todos os testes digite 'rspec' no console
2. Para rodar os testes de controller digite: 'rspec spec/controllers'
3. Para rodar os testes de model digite: 'rspec spec/models'

## Como testar a API localmente

1. Install postman, insomnia or another application to test APIs

# User

1. Para testar o metodo #create do User:
	Method: POST
	URL: http://localhost:3000/signup
	Body(raw/JSON):
		{
			"user": {
					"email": "test@test.com",
					"password": "123456",
					"name": "Test"
			}
		}
	Authorization: none

	-> Deve retornar:

		{
				"user": {
						"name": "juliano",
						"email": "juliano3@test.com"
				}
		}

2. Para testar o #login do User:
	Method: POST
	URL: http://localhost:3000/login/
	Body (raw/JSON):
		{
  	  "user": {
    	    "email": "test@test.com",
      	  "password": "123456"
    	}
		}
	Authorization: none

	-> Deve retornar:

		{
			"user": {
					"name": "test",
					"email": "test@test.com",
					"token": "eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI4NTljODc3Yi0zY2FiLTQ0Y2ItYWYzNy1kMWQ0YWJmYjQ4ODQiLCJzdWIiOiIyIiwic2NwIjoidXNlciIsImF1ZCI6bnVsbCwiaWF0IjoxNjk2NTMxNDU5LCJleHAiOjE2OTY1MzMyNTl9.wj9PqqDoczAqXNRriMPxWNpqSlgN-0PzV0_Oo8Vw8KQ"
			}
		}
	
	3. Para testar o #logout do User:
	Method: DELETE
	URL: http://localhost:3000/logout/
	Body (raw/JSON): none
	Authorization: <inserir o token que recebeu no login>

	-> Deve retornar:
		status 200

# Store

1. Para testar o método #create do User:
	Method: POST
	URL: http://localhost:3000/stores/
	Authorization: <inserir um token de usuário válido>
	Body:
		{
    	"name": "Test Store API"
		}

	-> Deve retornar:
	status 201

		{
			"store": {
					"id": 1,
					"name": "Test Store API"
			}
		}

2. Para testar o #index da Store:
	Method: GET
	URL: http://localhost:3000/stores/
	Authorization: <inserir um token de usuário válido>
	Body: none

	-> Deve retornar:
	status 200

		{
			"stores": [
					{
							"id": 1,
							"name": "Test Store API"
					}
			]
		}

3. Para testar o #show da Store:
	Method: GET
	URL: http://localhost:3000/stores/:id
	Authorization: <inserir um token de usuário válido>
	Body: none

	-> Deve retornar:
	status 200 + Store que buscou pelo ID (:id no URL)

4. Para testar o #update da Store:
	Method: PUT or PATCH
	URL: http://localhost:3000/stores/:id
	Authorization: <inserir um token de usuário válido>
	Body:
		{
			"name": "Updated Test Store API 3.1"
		}

		-> Deve retornar:
		status 200 + Store com o novo nome
	
	5. Para testar o #destroy da Store:
		Method: DELETE
		URL: http://localhost:3000/stores/:id
		Authorization: <inserir um token de usuário válido>
		Body: none

		-> Deve retornar:
		status 204

## Como testar a API hospedada na AWS EC2

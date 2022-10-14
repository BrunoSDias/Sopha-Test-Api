
## Instruções de Uso
 Primeiro é importante lembrar de executar o Docker antes de usar os comandos que virão a seguir.
 Para executar o Docker, o comando é "docker compose up". Para desativá-lo, o comando é "docker compose stop".

 - Para rodar os testes da aplicação, usa-se o comando "docker compose exec web bundle exec rspec path_do_arquivo_de_teste"
 - Para construir a aplicação, usa-se o comando "docker compose build"
 - Para rodar as migrations, o comando é "docker compose exec web bundle exec rails db:migrate"
 - Para usar outros comandos do rails, como "rails routes", "rails db:migrate:status" por exemplo,
 lembre de usar o prefixo "docker compose exec web bundle exec" antes.

 ## Endpoints
 - Login: "/auth/sign_in"
	verbo http: POST

	**request_body**:
		{
			"email": "username@email.com",
			"password": "123123123"
		}


	**response_body**:
     {
      "data": {
          "id": 1,
          "email": "johndoe@gmail.com",
          "provider": "email",
          "name": "John Doe",
          "uid": "johndoe@gmail.com"
      }
    }

------------------------------------------

  - Cadastro: "/auth"
    verbo http: POST

  **request_body**:
		{
      "name": "username",
			"email": "username@email.com",
			"password": "123123123"
		}


  **response_body**:
    {
      "id": null,
      "email": "johndoe@gmail.com",
      "name": "John Doe",
      "created_at": null,
      "updated_at": null,
      "provider": "email",
      "uid": ""
    }

-------------------------------------------

 - Criar loja: "/stores"
	verbo http: POST

	**request_body**: 
  {
		store: {
			name: "myStore",
			user_id: 1
		}
	}

	**response_body**:
		{
			id: 1,
			name: "myStore",
			user_id: 1
		}

	status_code: 201
-----------------------------------------
 - Visualizar loja: "/stores/:id"
	verbo http: GET

	**parametro**: ID da loja

	**response_body**:
		{
			id: 1,
			name: "myStore"
		}

	status_code: 200
-----------------------------------------
 - Editar loja: "/stores/:id"
	verbo http: PUT

	**parametro**: ID da loja

	**request_body**:
		store: {
			name: "myNewStore",
			user_id: 1
		}


	**response_body**: Não terá nenhuma informação na resposta da request

	status_code: 204
------------------------------------------
 - Deletar loja: "/stores/:id"
	verbo http: DELETE

	**parametro**: ID da loja

	**response_body**: Não terá nenhuma informação na resposta da request

	status_code: 204
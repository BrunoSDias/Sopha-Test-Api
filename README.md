# Setup

Ferramenta necessária: **Docker**

Tenha um arquivo `.env.yaml` na raiz do projeto contendo os seguintes dados:
```yml
database: 123456789
secret_key: 62b5eef3b057c5fcc312baad2e23ca6258f7450a06d6e35f71cb151a516d520688c38bcc007b96e94c6e463d51ed47316948e365088a45a0534ff21dce33855a
```

Execute o comando: `docker compose up --build` para criar e inicializar os containers.

# Crie o usuário de produção no banco de dados:

Use o comando abaixo para ter controle do container com o Postgres
`docker exec -it sopha-test-api-db-1 bash`

Então troque para a role postgres
`su - postgres`

Rode o comando a seguir
`createuser --interactive --pwprompt` 

Um prompt interativo aparecerá para você, insira esses dados:
- username: `sopha-api-test`
- password: `123456789`
- (repita o password)
- superuser `y`

Você já pode sair do terminal do postgres usando `exit` duas vezes seguidas

Crie os bancos de dados Development,Test e Production com os comandos: 
```
docker container exec sopha-test-api-web-1 bash -c "RAILS_ENV=development rails db:create"
docker container exec sopha-test-api-web-1 bash -c "RAILS_ENV=development rails db:migrate"
docker container exec sopha-test-api-web-1 bash -c "rails db:create"
docker container exec sopha-test-api-web-1 bash -c "rails db:schema:load"
```

# Introduction

Permite que possa ser feito cadastro de um usuário e que esse usuário (user) logado possa fazer CRUD em lojas (store).

# Parâmetros

Para cadastro login e afins, os parâmetros devem ser enviados via **Body**, com o **Header** indicando *Content-Type: application/json*.

# Login e Token

Ao fazer o login, o usuário recebe um Token como resposta, esse deve ser usado para fazer a administração das lojas (stores).

# Autenticação via Token

Deve ser enviada no **Header** do tipo **API Key**, com a chave com nome de **Authorization**.

# Testes

Para rodar os testes locais, use o comando: `docker container exec sopha-test-api-web-1 rails test`.

# Endpoints Locais

| Verbo  | URL                    | Descrição                  |
|--------|------------------------|----------------------------|
| POST    | localhost:3000/api/v1/sign_in | Login de Usuário           |
| POST   | localhost:3000/api/v1/sign_up | Cadastro de Usuário        |
| GET    | localhost:3000/api/v1/stores  | Adquirir Lojas             |
| POST   | localhost:3000/api/v1/stores  | Criar Loja                 |
| GET    | localhost:3000/api/v1/stores/id   | Visualizar Loja Individual |
| PUT    | localhost:3000/api/v1/stores/id   | Atualizar Loja Individual  |
| DELETE | localhost:3000/api/v1/stores/id   | Deletar Loja Individual    |

# Endpoints No AWS EC2

| Verbo  | URL                    | Descrição                  |
|--------|------------------------|----------------------------|
| POST    | http://100.27.31.120:3000/api/v1/sign_in | Login de Usuário           |
| POST   | http://100.27.31.120:3000/api/v1/sign_up | Cadastro de Usuário        |
| GET    | http://100.27.31.120:3000/api/v1/stores  | Adquirir Lojas             |
| POST   | http://100.27.31.120:3000/api/v1/stores  | Criar Loja                 |
| GET    | http://100.27.31.120:3000/api/v1/stores/id   | Visualizar Loja Individual |
| PUT    | http://100.27.31.120:3000/api/v1/stores/id   | Atualizar Loja Individual  |
| DELETE | http://100.27.31.120:3000/api/v1/stores/id   | Deletar Loja Individual    |

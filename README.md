## Objetivo
Criar uma API responsável por gerenciar um catálogo de lojas (Store) e hospedá-lo em uma instância AWS EC2.

### Estrutura
Essa API deve ter:
Um Model User com os atributos name, email e password;
Um Model Store com os atributos name, user_id;
Onde:
Store esteja ligado ao User;

As seguintes requisições devem ser possíveis:
Processo de autenticação de um User (Signup, Signin); JWT (JSON Web Token)
Requisições de CRUD (Create, Read, Update, Delete) para Store (Essas requisições só devem ser possíveis se o usuário estiver autenticado);

### Setup
- Ruby v3.2.2;
- Ruby on Rails v7.0.8;
- PostgreSQL v12.16;
- Docker;
- AWS EC2;

### Ambiente
1. Configurando:

Iniciando:
Clone o repositório ou realize um fork;

Inicie o ambiente do framework Ruby on Rails conforme o padrão. Documentação `https://rubyonrails.org`

Posteriormente:
```bash
bundle install
```

2. Docker (Opcional):

```bash
docker-compose up --build
```

3. Configurando o banco de dados:

```bash
rails db:create db:migrate
```

### Projeto rodando localmente
1. Start Rails:

```bash
rails server
```

Padrão local -> `http://localhost:3000/`

### AWS EC2 - Amazon Elastic Beanstalk
Disponível em:
[http://](http://)

### Testes nativos em Rails
obs.: testes de unidade para os modelos, testes funcionais para os controladores e testes de integração para verificar o comportamento geral das rotas e funcionalidades. Os testes de unidade podem ser criados na pasta test/models, os testes funcionais na pasta test/controllers e os testes de integração na pasta test/system.

1. Teste geral:
    ```bash
    $ rails test
    ```
2. Teste específico:
    ```
    $ rails test:system
    ```

### Endpoints
Lojas:
POST /users/:id_user/stores -- Cria uma nova loja associada a um usuário.
GET /users/:id_user/stores -- Lista as lojas pertencentes a um usuário específico.
GET /users/:id_user/stores/:id_loja -- Exibe detalhes de uma loja específica.
PATCH /users/:id_user/stores/:id_loja -- Atualiza os detalhes de uma loja específica.
DELETE /users/:id_user/stores/:id_loja -- Exclui uma loja específica.

Usuários:
POST /users/signup -- Rota para criar um novo usuário.
POST /users/signin -- Rota para autenticar um usuário.
GET /users -- Rota para listar todos os usuários.
PATCH /users/:id_user -- Rota para atualizar os detalhes de um usuário.
DELETE /users/:id_user -- Rota para excluir um usuário.

Todos os endpoints necessitam de autenticação JWT Token Bearer;

- Foi utilizado o software Postman para lidar com os endpoints. Se trata de uma clássica plataforma API para desenvolvimento e manipulação de APIs. `https://www.postman.com`
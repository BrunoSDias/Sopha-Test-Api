## Sopha - Desafio Backend

### Sobre o Projeto

Este projeto é uma API Rails que permite a criação de usuários e lojas, além de permitir a autenticação de usuários e a atualização de lojas.

### Pré-requisitos

- Ruby 2.7.0
- Rails 6.x
- PostgreSQL 0.18.x
- Docker 19.x
- Docker Compose 1.25.x

### Setup de Desenvolvimento

1. Instale as dependências:

```bash
bundle install
```

```bash
yarn install
```

2. Utilizando Docker e Docker Compose:

```bash
docker-compose up --build
```

3. Configure o banco de dados:

```bash
rails db:create db:migrate
```

### Como Rodar o Projeto

1. Inicie o servidor Rails:

```bash
docker-compose up
```

Agora a API deve estar disponível em `http://localhost:3000/`.


### Deploy no EC2

A API também está disponível no endereço: [http://18.219.103.88:3000](http://18.219.103.88:300)
conforme solicitado no desafio.

### Como Rodar os Testes

1. RSpec para testes de unidade e integração:

    ```bash
    rspec
    ```

2. RSwag para geração da documentação Swagger:

    ```bash
    rake rswag:specs:swaggerize
    ```

### Endpoints Disponíveis

Descrição rápida dos principais endpoints, como:
- `POST /auth` - Cria um novo usuário
- `POST /auth/sign_in` - Autentica um usuário
- `GET /stores` - Retorna todos as lojas 
- `POST /stores` - Cria uma nova loja
- `PUT /stores/:id` - Atualiza uma loja específica
- `DELETE /stores/:id` - Deleta uma loja específica
- `GET /stores/:id/`  - Retorna uma loja específica`

> Para detalhes completos, consulte a documentação Swagger em `http://localhost:3000/api-docs/index.html`.
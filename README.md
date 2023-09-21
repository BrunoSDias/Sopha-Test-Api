## Objetivo
Criar uma API responsável por gerenciar um catálogo de lojas (Store) e hospedá-lo em uma instância AWS EC2.

## Setup
- Ruby v2.7.1;
- Ruby on Rails v5.1.3;
- PostgreSQL;
- Docker (Opcional);
- AWS EC2;

## Ambiente
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

## Projeto rodando localmente
1. Start Rails:

```bash
rails server
```

Padrão local -> `http://localhost:3000/api/`

## AWS EC2 - Amazon Elastic Beanstalk
Disponível em:
[API](http://)

## Testes RSpec
obs.: Test-Driven Development (TDD): O RSpec é uma ferramenta útil para seguir a prática do TDD, onde você escreve testes antes de implementar o código de produção. Isso ajuda a garantir que seu código seja testado automaticamente e atenda aos requisitos esperados. O RSpec é facilmente integrado com Ruby on Rails e fornece suporte para testar controladores, modelos, visualizações e funcionalidades de roteamento, entre outros.

1. Teste geral:
    ```bash
    rspec
    ```
2. Teste arquivo específico:
    ```
    rspec spec/models/user_spec.rb
    ```
3. RSpec fornece uma saída detalhada dos resultados dos testes:
    ```
    rspec --format documentation
    ```

## Endpoints
```
rails routes
```
ou
```
rake routes | grep POST  # lista todos métodos POST
```
Lojas:
- `POST /api/stores` -- Cria uma nova loja associado a um usuário "user_id".
- `GET /api/stores/` -- Exibe lojas.
- `PATCH /api/stores/:id` -- Atualiza os detalhes de uma loja.
- `DELETE /api/stores/:id` -- Exclui uma loja específica.

Usuários:
- `POST /api/auth` -- Rota para criar um novo usuário;
- `POST /api/auth/sign_in` -- Rota para autenticar um usuário;
- `PATCH /api/auth` -- Rota para atualizar os detalhes de um usuário;
- `DELETE /api/auth` -- Rota para excluir um usuário;

### Rotas API
| Prefix                        | Verb  | URI Pattern                           | Controller#Action                                               |
| ----------------------------- | ----- | ------------------------------------- | --------------------------------------------------------------- |
| new_api_user_session          | GET   | /api/auth/sign_in(.:format)           | devise_token_auth/sessions#new {:format=>:json}                 |
| api_user_session              | POST  | /api/auth/sign_in(.:format)           | devise_token_auth/sessions#create {:format=>:json}              |
| destroy_api_user_session      | DELETE| /api/auth/sign_out(.:format)          | devise_token_auth/sessions#destroy {:format=>:json}             |
| new_api_user_password         | GET   | /api/auth/password/new(.:format)      | devise_token_auth/passwords#new {:format=>:json}                |
| edit_api_user_password        | GET   | /api/auth/password/edit(.:format)     | devise_token_auth/passwords#edit {:format=>:json}               |
| api_user_password             | PATCH | /api/auth/password(.:format)          | devise_token_auth/passwords#update {:format=>:json}             |
|                               | PUT   | /api/auth/password(.:format)          | devise_token_auth/passwords#update {:format=>:json}             |
|                               | POST  | /api/auth/password(.:format)          | devise_token_auth/passwords#create {:format=>:json}             |
| cancel_api_user_registration  | GET   | /api/auth/cancel(.:format)            | devise_token_auth/registrations#cancel {:format=>:json}         |
| new_api_user_registration     | GET   | /api/auth/sign_up(.:format)           | devise_token_auth/registrations#new {:format=>:json}            |
| edit_api_user_registration    | GET   | /api/auth/edit(.:format)              | devise_token_auth/registrations#edit {:format=>:json}           |
| api_user_registration         | PATCH | /api/auth(.:format)                   | devise_token_auth/registrations#update {:format=>:json}         |
|                               | PUT   | /api/auth(.:format)                   | devise_token_auth/registrations#update {:format=>:json}         |
|                               | DELETE| /api/auth(.:format)                   | devise_token_auth/registrations#destroy {:format=>:json}        |
|                               | POST  | /api/auth(.:format)                   | devise_token_auth/registrations#create {:format=>:json}         |
| new_api_user_confirmation     | GET   | /api/auth/confirmation/new(.:format)  | devise_token_auth/confirmations#new {:format=>:json}            |
| api_user_confirmation         | GET   | /api/auth/confirmation(.:format)      | devise_token_auth/confirmations#show {:format=>:json}           |
|                               | POST  | /api/auth/confirmation(.:format)      | devise_token_auth/confirmations#create {:format=>:json}         |
| api_auth_validate_token       | GET   | /api/auth/validate_token(.:format)    | devise_token_auth/token_validations#validate_token              |
| api_stores                    | GET   | /api/stores(.:format)                 | api/v1/stores#index {:format=>:json}                            |
|                               | POST  | /api/stores(.:format)                 | api/v1/stores#create {:format=>:json}                           |
| api_store                     | GET   | /api/stores/:id(.:format)             | api/v1/stores#show {:format=>:json}                             |
|                               | PATCH | /api/stores/:id(.:format)             | api/v1/stores#update {:format=>:json}                           |
|                               | PUT   | /api/stores/:id(.:format)             | api/v1/stores#update {:format=>:json}                           |
|                               | DELETE| /api/stores/:id(.:format)             | api/v1/stores#destroy {:format=>:json}                          |

> Autenticação Devise Token Auth;

- Foi utilizado o software Insomnia para lidar com os endpoints. Se trata de uma plataforma para debug e testes de APIs. `https://insomnia.rest`
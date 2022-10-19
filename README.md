

# Avaliação Sopha
## Para iniciar
Realize um **fork** desse repositório
**clone** o projeto do fork

Execute o comando para provisionar a aplicação:

    $ docker-compose up --build

## Sobre
O candidato deve fazer um **fork** deste repositório e realizar um **pull request** com o código do teste pronto antes do prazo de vencimento do desafio.

## Objetivo

O candidato deve criar uma **API** responsável por gerenciar um catalogo de lojas (**Store**)  e hospedá-lo em uma instância **AWS EC2**.

## Estrutura
Essa **API** deve ser constituída por:

 - Um Model **User** com os atributos **name, email e password**
 - Um Model **Store** com os atributos **name, user_id**
 -  Onde:
	 - **Store** pertence à **User**
	 
## Funcionalidade
As seguintes requisições devem ser possíveis:

 - Processo de autenticação de um **User** (Signup, Signin)
  - Requisições de **CRUD** (Create, Read, Update, Delete) para **Store**  (Estas requisições só devem ser possíveis se o usuário estiver autenticado)


## Conhecimentos necessários
-  Ruby
-  Ruby on Rails
-  AWS EC2
-  Servidores HTTP
-  SQL
-  Postgres 
-   Git

## Requisitos

-   Docker

## O que esperamos da solução

 -  Que todas as ações requisitadas funcionem.
 -  Que haja testes automatizados sobre essas ações (TDD).
 -  Que seja possível testar essas ações do ambiente local (Localhost) na **aplicação hospedada**.
 -  Instruções de uso no README.md
	 - Como rodar os testes da aplicação
	 - Quais os **endpoints** devo acessar para realizar as requisições esperadas na **aplicação hospedada**
	 - Quais os **parâmetros** e/ou **cabeçalhos**  devo enviar para realizar cada uma das requisições esperadas na **aplicação hospedada**
 -  É **Opcional** utilizar **docker** na **aplicação hospedada**.
 - Uso de **gems** adicionais também é opcional

## O que avaliaremos

 - Funcionalidade
 - Boas práticas

# Informações adicionadas pelo candidato

### Para rodar os teste da aplicação

```
    rpsec 
```

## API Endpoints

A API irá expôr os seguintes RESTful endpoints.
### BaseUrl: {Host-URL}/api/v1

| Endpoint                | Funcionalidade               |
|-------------------------|------------------------------|
| POST /users             | Signup                       |
| POST /authenticate      | Login                        |
| POST /stores            | Add a new Store              |
| GET /stores/:i          | Show the store               |
| DELETE /cars/:id        | Delete a store               |
| PUT /cars/:id           | Update a store               |


## Documentação da API
[Sopha Test API](https://documenter.getpostman.com/view/23638188/2s847BVGhC)

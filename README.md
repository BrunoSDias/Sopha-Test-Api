

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
 -  A aplicacão **DEVE** estar hospedada em uma instância **AWS EC2**
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


# Dados do desafio<br/>

 ## na autenticação usei devise_token_auth<br/>

- para testar: localhost:3000/auth<br/>
rota '/auth'<br/>

{
    "name": "Lucemila Test",<br/>
    "email": "test@test.com",<br/>
    "password": "12345678",<br/>
    "password_confirmation": "12345678"<br/>
}

- para login localhot:3000/auth/sign_in<br/>
rota '/auth/sign_in'<br/>
{
    "email": "test@test.com",<br/>
    "password": "12345678"<br/>
}

- após login, pegar o valor do access-token, uid e client do retorno do login
e incluir no header do endpoint '/stores' para criar um store necessário <br/>

{
    "name": "Loja Sopha",<br/>
    "user_id": 4<br/>
}

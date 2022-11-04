# Avaliação Sopha

## Para iniciar
Execute o comando para provisionar a aplicação:

     docker-compose up --build

## Usuário

Abaixo temos as rotas de usuários, junto a cada uma das rotas também existe um exemplo de requisição.

#### Registro 

     Post localhost:3000/api/auth
     
#### Registro - Exemplo de Requisição

     {
      "email": "email@provedor.com",
      "password": "12345678",
      "password_confirmation": "12345678"
     }
     
#### Login 

     Post localhost:3000/api/auth/sign_in
     
#### Login - Exemplo de Requisição

     {
      "email": "email@provedor.com",
      "password": "12345678",
     }
     
##### Neste caso, nos headers serão retornadas informação que serão utilizadas para validar a autenticação. Neste casa utilizaremos: access-token, client, uid

#### Validação da Autenticação 

     Get localhost:3000/api/auth/validate_token
     
#### Validação da Autenticação  - Exemplo de Requisição

	Headers: access-token, client, uid
	
#### Logout 

     Delete localhost:3000/api/auth/sign_out
     
#### Logout  - Exemplo de Requisição

	Headers: access-token, client, uid
     
## Store

Assim como solicitado as rotas abaixo só podem ser acessadas após a autheticação do token.

#### Criação 

     Post localhost:3000/api/v1/stores
     
#### Criação - Exemplo de Requisição

     { 
     	store: { 
		name: 'Loja teste' 
		}
     }
     
     Headers: access-token, client, uid
     
#### Index 

     Get localhost:3000/api/v1/stores
     
#### Index - Exemplo de Requisição

     Headers: access-token, client, uid
     
#### Show 

     Get localhost:3000/api/v1/stores/:id
     
#### Show  - Exemplo de Requisição
	    
     Headers: access-token, client, uid
	
#### Update 
     
     Patch localhost:3000/api/auth/sign_out
     
#### Update - Exemplo de Requisição
	{ 
	  store: { 
	  	   name: 'Loja Nova'
		 } 
	}
	
	Headers: access-token, client, uid
	
#### Delete 

     Delete localhost:3000/api/v1/stores/:id
     
#### Delete - Exemplo de Requisição

	Headers: access-token, client, uid
	
## EC2

Infelizmente não foi possível subir a aplicação me produção.

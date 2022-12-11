
# Introduction

Permite que possa ser feito cadastro de um usuário e que esse usuário (user) logado possa fazer CRUD em lojas (store).

# Parâmetros

Para cadastro login e afins, os parâmetros devem ser enviados via **Body**, com o **Header** indicando *Content-Type: application/json*.

# Login e Token

Ao fazer o login, o usuário recebe um Token como resposta, esse deve ser usado para fazer a administração das lojas (stores).

# Autenticação via Token

Deve ser enviada no **Header** do tipo **API Key**, com a chave com nome de **Authorization**.

# Endpoints Locais

| Verbo  | URL                    | Descrição                  |
|--------|------------------------|----------------------------|
| GET    | localhost:3000/sign_in | Login de Usuário           |
| POST   | localhost:3000/sign_up | Cadastro de Usuário        |
| GET    | localhost:3000/stores  | Adquirir Lojas             |
| POST   | localhost:3000/stores  | Criar Loja                 |
| GET    | localhost:3000/store   | Visualizar Loja Individual |
| PUT    | localhost:3000/store   | Atualizar Loja Individual  |
| DELETE | localhost:3000/store   | Deletar Loja Individual    |

# Endpoints No AWS EC2

| Verbo  | URL                    | Descrição                  |
|--------|------------------------|----------------------------|
| GET    | http://34.207.245.186:3000/sign_in | Login de Usuário           |
| POST   | http://34.207.245.186:3000/sign_up | Cadastro de Usuário        |
| GET    | http://34.207.245.186:3000/stores  | Adquirir Lojas             |
| POST   | http://34.207.245.186:3000/stores  | Criar Loja                 |
| GET    | http://34.207.245.186:3000/store   | Visualizar Loja Individual |
| PUT    | http://34.207.245.186:3000/store   | Atualizar Loja Individual  |
| DELETE | http://34.207.245.186:3000/store   | Deletar Loja Individual    |
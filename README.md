# Avaliação Sopha

## Para utilizar a aplicação online

Para testar esta API de forma prática, você pode utilizar o **Insomnia** ou o **Postman**.

### Links para instalação do Postman ou Insomnia

- [Insomnia](https://insomnia.rest/)
- [Postman](https://www.postman.com/)

## URL da aplicação

Acesse a nossa aplicação através do seguinte link:

[http://15.229.45.131/](http://15.229.45.131/) 

## Endpoints para o Auth e Store

Estruturamos uma documentação para todos os endpoints de autenticação e recursos Store, que está disponível [aqui](https://colorful-lupin-82f.notion.site/Sopha-api-f35a6f5d3a724d60b0a974bd3ec54fbb).

### Registro de Usuário (Sign Up)

Para criar uma conta, faça um POST para `http://15.229.45.131/api/auth` com o seguinte exemplo de corpo da requisição: (conforme tem na documentação)

```json
{
  "email": "jv@gmail.com",
  "password": "password_user",
  "password_confirmation": "password_user",
  "name": "joao"
}
```

### Login

Após criar sua conta, siga o processo de autenticação realizando um POST em:
[http://15.229.45.131/api/auth/sign_in](http://15.229.45.131/api/auth/sign_in)

Forneça seu email e senha. Após a autenticação bem-sucedida, você poderá obter as informações de autenticação dos cabeçalhos (uid, client e access_token).

## Testando a Aplicação localmente

Se desejar testar a aplicação localmente, siga os passos abaixo:

1. Certifique-se de ter instalado o Docker em sua máquina.

2. Construa o container utilizando o comando:
`$ docker-compose up --build`

3. Acesse o seu container com o comando:
`$ docker exec -it nome_do_container /bin/bash`

4. Dentro do container, execute o comando para instalar as dependências:
`$ bundle install`

5. Crie o banco de dados e execute as migrações:
`$ bundle exec rails db:create && bundle exec rails db:migrate`

6. Para rodar os testes dentro do container após a configuração, execute o comando:
`$ bundle exec rspec spec`

7. Execute a aplicação com o comando:
`$ bundle exec rails s`

Em seguida refaça os passos da aplicação online porém utilize [http://localhost:3000/](http://localhost:3000/) para acessar a aplicação localmente.
## Tecnologias Utilizadas

Nossa aplicação foi desenvolvida utilizando as seguintes tecnologias:

- Ruby
- Ruby on Rails
- AWS EC2
- NGinx
- SQL
- Postgres
- Git
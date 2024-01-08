# **Code Challenge Resolution**

**To install locally:**

Installation:

1- Clone the project repository:

`git clone git@github.com:Castrosbruno/Sopha-Test-Api.git`

2- Enter the root of the cloned project and run the commands below step by step:

`cd Sopha-Test-Api.git`

3- Start the application:

`docker-compose up`
___________________________________________________________________________________________________

**Como efetuar os testes locais:**

Confira a documentação completa dos testes no arquivo fornecido abaixo. Este link é um arquivo JSON; basta importá-lo no Postman para facilitar seu uso.

Arquivo:

[Code Challenge.postman_collection.json](https://github.com/BrunoSDias/Sopha-Test-Api/files/13862909/Code.Challenge.postman_collection.json)


**Abaixo está a documentação explicativa sobre como realizar os testes:**

> **- User**


**Criação de Usuário (Create User):**

```
1. Passo Inicial:

Para criar um usuário, utilizamos o método POST na rota http://localhost:3000/auth.

2. Preparação da Requisição:

Abra o Postman.
Selecione o método POST.
Insira a rota http://localhost:3000/auth.

3. Configuração do Corpo da Requisição:

Selecione a aba Body.
Escolha o formato raw (json).

4. Preencha os Dados do Usuário:

No formato JSON, forneça os detalhes do usuário:

json
{
    "email": "email@dominio.com",
    "name": "bruno",
    "password": "teste123",
    "password_confirmation": "teste123",
    "confirm_success_url": ""
}

5. Envio da Requisição:

Clique em Enviar para executar a requisição.
```

**Realizar Login (Sign In):**

```
1. Procedimento Inicial:

Para iniciar uma sessão (sign in), empregamos o método POST na rota http://localhost:3000/auth/sign_in.

2. Configuração da Requisição:

Abra o [Postman](https://www.postman.com/).
Selecione o método POST.
Insira a rota http://localhost:3000/auth/sign_in.

3. Estrutura do Corpo da Requisição:

Selecione a aba Body.
Opte pelo formato raw (json).

4. Preenchimento das Credenciais:

No formato JSON, forneça as credenciais do usuário para iniciar a sessão:

json
{
    "email": "email@dominio.com",
    "name": "Jorge",
    "password": "teste123",
    "password_confirmation": "teste123",
    "confirm_success_url": ""
}

5. Efetuação da Requisição:

Clique em Enviar para executar a requisição.
```

**Encerramento de Sessão (Sign Out):**

```
1. Passo Inicial:
Para encerrar a sessão do usuário, utilize o método DELETE na rota http://localhost:3000/auth/sign_out.

2. Configuração Inicial:

Abra o Postman.
Selecione o método DELETE.
Insira a rota http://localhost:3000/auth/sign_out.

3. Configuração dos Headers:

Adicione os seguintes headers à sua requisição:

uid: email@dominio.com
access_token: QTD1a-GHIog5zNzuFKVJRA
client: -h2mY1jbGC1RjRh7zBNsgg

4. Envio da Requisição:

Clique em Enviar para executar a requisição.

Lembre-se de que as informações utilizadas nos headers são as mesmas fornecidas durante a criação da conta.

Esta ação simula o encerramento da sessão do usuário.
```

> **- Store**

**Criação de uma Loja (Create Store):**

```
1. Passo Inicial:
Para criar uma loja, utilize o método POST na rota http://localhost:3000/api/v1/stores.

2. Configuração Inicial:

Abra o Postman.
Selecione o método POST.
Insira a rota http://localhost:3000/api/v1/stores.

3. Configuração dos Headers:

Adicione os seguintes headers à sua requisição:

uid: email@dominio.com
access_token: HRntTZ-I1LzTUOhQe8ZaBw
client: eCiOUbHD6f6T_pTNb-oDhA

4. Configuração do Corpo da Requisição:
Selecione a aba Body.
Escolha o formato raw (json).

5. Preencha o nome da Loja:
No formato JSON, forneça os detalhes da loja:

json
{
    "name": "Manoel"
}

6.Envio da Requisição:
Clique em Enviar para executar a requisição.

Lembre-se de que as informações utilizadas nos headers são as mesmas fornecidas durante a criação da conta.
```

**Consulta de uma Loja Específica (Get Specific Store):**

```
1. Passo Inicial:

Para obter informações sobre uma loja específica, utilize o método GET na rota http://localhost:3000/api/v1/stores/3, onde "3" é o ID da loja desejada.

2. Configuração Inicial:

Abra o Postman.
Selecione o método GET.
Insira a rota http://localhost:3000/api/v1/stores/3 (substitua "3" pelo ID da loja desejada).

3. Configuração dos Headers:

Adicione os seguintes headers à sua requisição:

uid: email@dominio.com
access_token: HRntTZ-I1LzTUOhQe8ZaBw
client: eCiOUbHD6f6T_pTNb-oDhA

4. Envio da Requisição:

Clique em Enviar para executar a requisição e obter informações sobre a loja desejada.

Lembre-se de substituir "3" pelo ID correto da loja que você deseja consultar.
```

**Consulta de todas as Lojas (Get All Stores):**

```
1. Passo Inicial:

Para obter informações sobre todas as lojas, utilize o método GET na rota http://localhost:3000/api/v1/stores.

2. Configuração Inicial:

Abra o Postman.
Selecione o método GET.
Insira a rota http://localhost:3000/api/v1/stores.

3. Configuração dos Headers:

Adicione os seguintes headers à sua requisição:

uid: email@dominio.com
access_token: HRntTZ-I1LzTUOhQe8ZaBw
client: eCiOUbHD6f6T_pTNb-oDhA

4.Envio da Requisição:

Clique em Enviar para executar a requisição e obter informações sobre todas as lojas cadastradas.
```

**Atualização de Loja (Update Store):**

```
1. Passo Inicial:

Para atualizar informações de uma loja, utilize o método POST na rota http://localhost:3000/api/v1/stores.

2. Configuração Inicial:

Abra o Postman.
Selecione o método POST.
Insira a rota http://localhost:3000/api/v1/stores.

3. Configuração dos Headers:

Adicione os seguintes headers à sua requisição:

uid:  email@dominio.com
access_token: HRntTZ-I1LzTUOhQe8ZaBw
client: eCiOUbHD6f6T_pTNb-oDhA

4. Configuração do Corpo da Requisição:

Selecione a aba Body.

Escolha o formato raw (json).

Forneça os dados a serem atualizados no seguinte formato JSON:

json
Copy code
{
    "name": "bernardo"
}

5. Envio da Requisição:

Clique em Enviar para executar a requisição e atualizar as informações da loja.
```

**Exclusão de Loja (Delete Store):**

```
1. Passo Inicial:

Para excluir uma loja, utilize o método DELETE na rota http://localhost:3000/api/v1/stores/3.

2. Configuração Inicial:

Abra o Postman.
Selecione o método DELETE.
Insira a rota http://localhost:3000/api/v1/stores/3.

3. Configuração dos Headers:

Adicione os seguintes headers à sua requisição:

uid: email@dominio.com
access_token: HRntTZ-I1LzTUOhQe8ZaBw
client: eCiOUbHD6f6T_pTNb-oDhA

4. Envio da Requisição:

Clique em Enviar para executar a requisição e excluir a loja específica.
```

**Observações:**

- Certifique-se de que o seu servidor local esteja em execução.
- Os dados fornecidos são apenas um exemplo; sinta-se à vontade para ajustá-los conforme necessário.
___________________________________________________________________________________________________

> **Como efetuar os testes via AWS EC2:**

```
Aqui estão as informações relevantes para acessar a instância AWS EC2:

Endereço IPv4 Público: 18.116.170.27

DNS IPv4 Público: ec2-18-116-170-27.us-east-2.compute.amazonaws.com

```

___________________________________________________________________________________________________


# Qualidade e métricas de código

**Ruby Critic**

![ruby critic](https://github.com/BrunoSDias/Sopha-Test-Api/assets/69633173/db854a1f-ad0a-436d-931a-bf00acb220bc)

**SimpleCov**

![simplecov](https://github.com/BrunoSDias/Sopha-Test-Api/assets/69633173/ab6c0252-3fad-492c-b32e-a9ca46a054df)

**Como obter essas métricas localmente**

- Para obter as métricas do Ruby Critic, devemos entrar no diretório da aplicação e rodar `rubycritic app`, após finalizar a suite de teste um arquivo é criado na pasta temp/rubycritic chamado **overview.html**, basta abri-lo no navegador.

- Para obter as métricas do SimpleCov, devemos entrar no diretório da aplicação e rodar a suite de testes, utilizando o comando `rspec`, após finalizar a suite de teste um arquivo é criado na pasta coverage chamado **index.html**, basta abri-lo no navegador.

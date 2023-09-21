# Deploy Ruby on Rails em uma instância AWS EC2
```sh
# Ambiente
# Instale e configure o ambiente WSL (Windows Subsystem for Linux) na sua máquina, além do Docker caso esteja no Windows. Vamos seguir por um terminal via Linux.
#link AWS -> https://aws.amazon.com/ec2/
```

```sh
# Conectando a instância no terminal
ssh -i /path_to_the_file/file_name.pem ubuntu@ip # IP público da instância EC2
# Ao executar isso e após o primeiro download, ocorrerá um erro
# Vai dizer que esta instância não é segura, porém executamos
# O seguinte cmd
chmod 400 /Downloads/example-key-1.pem
# Note que o arquivo chave .pem não tem permissão correta para execução
# Então logamos com o último comando
ssh -i /Downloads/example-key-1.pem ubuntu@ip

# Agora configuramos o ambiente normalmente na máquina, Use o rbenv
# Atualize
sudo apt update
sudo apt upgrade

# Verificando biblioteca para instalar o ruby
sudo apt install gcc make libssl-dev libreadline-dev zlib1g-dev libpq-dev build-essential -y
#sudo apt install gcc make libssl-dev libreadline-dev zlib1g-dev libsqlite3-dev <- sqlite3
sudo apt-get install build-essential # Compilar Sass
```

### Rbenv & Ruby Instalação Básica
```sh
# Depois clone o rbenv (Git vem com essas instâncias)
git clone https://github.com/rbenv/rbenv.git ~/.rbenv

# Adicione o caminho no .bashrc
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc

# Verificando o rails rodando somente em produção na máquina
echo 'export RAILS_ENV=production' >> ~/.bashrc
# SÓ SE VOCÊ QUISER VER O LOG DO SEU SERVIDOR, DAÍ ADICIONE ESTA LINHA ABAIXO
# echo 'export RAILS_LOG_TO_STDOUT=true' >> ~/.bashrc  
exit # reload no terminal

# Conecte-se à sua instância a partir do seu terminal novamente
ssh -i /path_to_the_file/file_name.pem ubuntu@ip 

# Em sequência será instalado o ruby-build (Responsável por manter todos
# as versões suportadas pelo rbenv)
mkdir -p "$(rbenv root)"/plugins
git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build


# Verificar o funcionamento da versão
rbenv -v
# -> rbenv 1.2.0-74-gd1f1865

# Install ruby
rbenv install 2.7.1 --verbose

# Tornando global
rbenv global 2.7.1

# Check
ruby -v
# -> ruby 2.7.1pxx (20xx-xx-xx revision xxxxx) [x86_64-linux]
```

### Instalando yarn
```sh
# Add downloads para source list
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
# Update e install 
sudo apt update && sudo apt install yarn
# Check
yarn --version
# -> 1.22.19
# Install Rails e Bundler
```

### Instalando Rails e complementando com alguns comandos extras
```sh
gem install rails -v 5.1.3  # lembrar de especificar versão para evitar conflitos posteriores
# Gerar um novo projeto ou pull no projeto desejado
# exemplo -> $ git clone https://github.com/jonathanmagliano/Sopha-Test-Api.git
rails new example 

# Compile assets (Ocasional)
rails assets:precompile

# RUN SERVER
screen rails s # ctrl-a d para detach screen ---> screen -r # Resume screen
rails server -e development  # exemplo rodando em modo desenvolvimento
exit
```

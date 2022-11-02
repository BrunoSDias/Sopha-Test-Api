#FIXME replace 1.2.3.4 with your IP address
server '54.84.22.248', user: 'deploy', roles: %w{web app db}
set :rails_env, 'production'
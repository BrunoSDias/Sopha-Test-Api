server 'https://ec2-35-89-204-246.us-west-2.compute.amazonaws.com:3000/', user: 'deploy', roles: %w{web app db}
set :rails_env, 'production'
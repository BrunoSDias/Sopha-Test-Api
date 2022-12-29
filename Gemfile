source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.3'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem "active_model_serializers", "~> 0.10.13"
gem 'rubocop', require: false

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem "factory_bot_rails", "~> 6.2"
  gem "faker", "~> 3.0"
  gem "rspec-rails", "~> 4.1"
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem "letter_opener", "~> 1.8"
end

group :test do
  gem "database_cleaner-active_record", "~> 2.0"
  gem "shoulda-matchers", "~> 4.5"
  gem "simplecov", "~> 0.21.2", require: false
end

gem "devise_token_auth", "~> 1.2"

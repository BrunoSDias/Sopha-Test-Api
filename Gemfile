source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.3'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem "letter_opener", "~> 1.8"
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem "devise_token_auth", "~> 1.2"
gem "active_model_serializers", "~> 0.10.13"

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
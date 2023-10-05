# frozen_string_literal: true

desc 'Setup the database'
task :setup do
  bundle install

  Rake::Task['db:create'].invoke

  Rake::Task['db:migrate'].invoke unless Rake::Task['db:migrate'].invoked?

  Rake::Task['db:migrate RAILS_ENV=test'].invoke unless Rake::Task['db:migrate RAILS_ENV=test'].invoked?
end

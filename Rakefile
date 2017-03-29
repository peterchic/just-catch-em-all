require_relative 'config/environment'
require 'sinatra/activerecord/rake'

desc 'seed the database with some dummy data'
namespace :db do
  task :seed do
    require_relative './db/seeds.rb'
  end
end

desc 'starts a console'
task :console do
  Pry.start
end

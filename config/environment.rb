require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
#require_all 'models'
Dir[File.join(File.dirname(__FILE__), "../models/*.rb")].each {|f| require f}

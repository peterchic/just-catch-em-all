require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ActiveRecord::Base.logger = nil

require_all('lib')
require_all('models')
# Dir[File.join(File.dirname(__FILE__), "../models/*.rb")].each {|f| require f}
# Dir[File.join(File.dirname(__FILE__), "../lib/*.rb")].each {|f| require f}

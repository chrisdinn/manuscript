$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'manuscript'

Bundler.require :test

require 'spec'
require 'spec/autorun'
require 'rack/test'
require 'shoulda/active_record'

ActiveRecord::Base.establish_connection :adapter => 'sqlite3', :database =>  'manuscript_test.sqlite3.db'

require 'database_cleaner'
DatabaseCleaner.strategy = :truncation

Spec::Runner.configure do |config|
  config.include(Shoulda::ActiveRecord::Matchers)
  
  config.after(:each) do
    DatabaseCleaner.clean
  end
end

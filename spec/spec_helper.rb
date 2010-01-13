$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'manuscript'
require 'spec'
require 'spec/autorun'
require 'rack/test'
require 'shoulda/active_record'

require 'database_cleaner'
DatabaseCleaner.strategy = :truncation

Spec::Runner.configure do |config|
  config.include(Shoulda::ActiveRecord::Matchers)
  
  config.after(:suite) do
    DatabaseCleaner.clean
  end
end

begin
  # Try to require the preresolved locked set of gems.
  require File.expand_path('../.bundle/environment', __FILE__)
rescue LoadError
  # Fall back on doing an unlocked resolve at runtime.
  require "rubygems"
  require "bundler"
  Bundler.setup :default, :development
end

Bundler.require :default, :development

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__),'lib'))
require 'manuscript'

Paperclip::Storage::S3::RAILS_ENV = "development"

ActiveRecord::Base.establish_connection :adapter => 'sqlite3', :database =>  'manuscript.sqlite3.db', :encoding => 'UTF-8'

use Rack::Session::Cookie
use Rack::Static, :urls => ["/template_files"]
use Gatekeeper::Middleware do |sso|
  sso.sso_url = "http://digital-achiever.com/sso"
end
use Manuscript::Keymaster
use Manuscript::PageManager
use Manuscript::DesignManager
use Manuscript::SettingsManager
run Manuscript::Base.new
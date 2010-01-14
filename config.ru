require 'rubygems'
require 'manuscript'

ActiveRecord::Base.establish_connection :adapter => 'sqlite3', :database =>  'manuscript.sqlite3.db'

use Rack::Session::Cookie
use Rack::Static, :urls => ["/template_files"]
use Gatekeeper::Middleware do |sso|
  sso.sso_url = "http://hotink.theorem.ca/sso"
end
use Manuscript::Keymaster, :hotink_account_id => 1
use Manuscript::PageManager
use Manuscript::TemplateManager
use Manuscript::TemplateFileManager
run Manuscript::Base.new
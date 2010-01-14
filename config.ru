$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'manuscript'

ActiveRecord::Base.establish_connection :adapter => 'sqlite3', :database =>  'manuscript.sqlite3.db'

use Rack::Session::Cookie
use Rack::Static, :urls => "/css", :root => "public"
use Gatekeeper::Middleware do |sso|
  sso.sso_url = "http://hotink.theorem.ca/sso"
end
use Manuscript::Keymaster
use Manuscript::PageManager
use Manuscript::TemplateManager
use Manuscript::TemplateFileManager
run Manuscript::Base.new
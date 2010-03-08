$LOAD_PATH.unshift(File.join(File.dirname(__FILE__),'lib'))
require 'manuscript'

ActiveRecord::Base.establish_connection :adapter => 'sqlite3', :database =>  'manuscript.sqlite3.db', :encoding => 'UTF-8'

use Rack::Session::Cookie
use Rack::Static, :urls => ["/template_files"]
use Gatekeeper::Middleware do |sso|
  sso.sso_url = "http://0.0.0.0:3000/sso"
end
use Manuscript::Keymaster
use Manuscript::PageManager
use Manuscript::TemplateManager
use Manuscript::TemplateFileManager
run Manuscript::Base.new
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'manuscript'

use Rack::Session::Cookie
use Gatekeeper::Middleware do |sso|
  sso.sso_url = "http://hotink.theorem.ca/sso"
end
use Manuscript::Keymaster
use Manuscript::PageManager
run Manuscript::Base.new
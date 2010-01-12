$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))

require 'manuscript'

use Manuscript::PageManager
run Manuscript::Base.new
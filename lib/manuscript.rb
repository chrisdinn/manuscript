require 'rack/static'

require 'gatekeeper'
require 'gatekeeper/helpers/authentication'

require 'sinatra/base'
require 'haml'
require 'active_record'
require 'logger'

require 'manuscript/base'
require 'manuscript/keymaster'
require 'manuscript/page'
require 'manuscript/page_manager'
require 'manuscript/template'
require 'manuscript/page_template'
require 'manuscript/layout_template'
require 'manuscript/template_manager'
require 'manuscript/template_file'
require 'manuscript/template_file_manager'
require 'manuscript/user'


log = File.new("application.log", "a")
STDOUT.reopen(log)
STDERR.reopen(log)
ActiveRecord::Base.logger = Logger.new(STDERR)

module Sinatra
  class Base
    set :views, File.dirname(__FILE__) + "/../views"
    set :static, true
    set :public, File.dirname(__FILE__) + "/../public"
    set :raise_errors, false
    set :logging, true
  end
end
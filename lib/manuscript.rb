require 'rubygems'
gem 'activerecord'
gem 'rdiscount'
gem 'sinatra'
gem 'haml'
gem 'gatekeeper'
gem 'liquid'
gem 'paperclip'

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

ActiveRecord::Base.logger = Logger.new(STDERR)

module Sinatra
  class Base
    set :views, File.dirname(__FILE__) + "/../views"
  end
end
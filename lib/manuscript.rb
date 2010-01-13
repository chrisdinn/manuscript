require 'rubygems'
gem 'activerecord'
gem 'rdiscount'
gem 'sinatra'
gem 'haml'
gem 'gatekeeper'

require 'gatekeeper'
require 'gatekeeper/helpers/authentication'

require 'sinatra/base'
require 'haml'
require 'active_record'

require 'manuscript/base'
require 'manuscript/keymaster'
require 'manuscript/page'
require 'manuscript/page_manager'
require 'manuscript/template'

ActiveRecord::Base.establish_connection :adapter => 'sqlite3', :database =>  'manuscript.sqlite3.db'
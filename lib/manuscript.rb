require 'rubygems'
gem 'activerecord'
gem 'rdiscount'
gem 'sinatra'
gem 'haml'

require 'sinatra/base'
require 'haml'
require 'active_record'

require 'manuscript/base'
require 'manuscript/page'
require 'manuscript/page_manager'

ActiveRecord::Base.establish_connection :adapter => 'sqlite3', :database =>  'manuscript.sqlite3.db'
require 'rubygems'
gem 'activerecord'
gem 'rdiscount'
gem 'sinatra'
gem 'haml'

require 'sinatra/base'
require 'haml'
require 'active_record'
require 'page'
require 'page_manager'

ActiveRecord::Base.establish_connection :adapter => 'sqlite3', :database =>  'manuscript.sqlite3.db'

class Manuscript < Sinatra::Base
  use PageManager
  
  get "/:page_name" do
    @page = Page.find_by_name(params[:page_name])
    raise Sinatra::NotFound unless @page
    @page.to_html
  end
end
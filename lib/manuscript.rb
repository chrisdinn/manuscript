begin
  # Try to require the preresolved locked set of gems.
  require File.expand_path('../.bundle/environment', __FILE__)
rescue LoadError
  # Fall back on doing an unlocked resolve at runtime.
  require "rubygems"
  require "bundler"
  Bundler.setup
end

Bundler.require

require 'manuscript/base'
require 'manuscript/keymaster'
require 'manuscript/page'
require 'manuscript/page_manager'
require 'manuscript/template'
require 'manuscript/page_template'
require 'manuscript/layout_template'
require 'manuscript/design_manager'
require 'manuscript/template_file'
require 'manuscript/user'


log = File.new("application.log", "a")
$stderr.reopen(log)
LOGGER = Logger.new($stderr)
ActiveRecord::Base.logger = LOGGER
OpenID::Util.logger = LOGGER

module Sinatra
  class Base
    set :views, File.dirname(__FILE__) + "/manuscript/views"
    set :static, true
    set :public, File.dirname(__FILE__) + "/../public"
    set :raise_errors, true
    set :logging, true
    
    helpers do
      def user_email
        if session[:sso]
          return session[:sso][:user_email]
        else
          nil
        end
      end
    end
  end
end
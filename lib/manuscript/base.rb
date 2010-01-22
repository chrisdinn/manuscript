module Manuscript
  class Base < Sinatra::Base    
    get "/" do
      @user = session[:sso].nil? ? nil : User.new(session[:sso])
      @page = Page.find_by_name('index')
      raise Sinatra::NotFound unless @page
      @page.to_html(@user)
    end
  
    get %r{/([-\w/]+)} do
      begin
        @user = session[:sso].nil? ? nil : User.new(session[:sso])
        @page = Page.find_by_path(params[:captures].first)
        raise Sinatra::NotFound unless @page
        @page.to_html(@user)
      rescue ActiveRecord::RecordNotFound
        raise Sinatra::NotFound
      end
    end
  end
end
module Manuscript 
  class Base < Sinatra::Base
    get "/:page_name" do
      @page = Page.find_by_name(params[:page_name])
      raise Sinatra::NotFound unless @page
      @page.to_html
    end
    
    get "/" do
      @page = Page.find_by_name('index')
      raise Sinatra::NotFound unless @page
      @page.to_html
    end
  end
end
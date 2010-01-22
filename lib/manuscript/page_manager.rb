module Manuscript 

  class PageManager < Sinatra::Base
    enable :methodoverride
    
    get "/admin/?" do
      redirect "/admin/pages"
    end
    
    get "/admin/pages/?" do
      @pages = Page.all
      haml :pages
    end
  
    get "/admin/pages/new" do
      @templates = Manuscript::PageTemplate.all
      @page = Page.new(:parent_id => params[:parent_id])
      haml :page
    end
  
    post "/admin/pages/?" do
      @page = Page.create!(params[:page])
      redirect "/admin/pages/#{@page.id}/edit"
    end
  
    get "/admin/pages/:id/edit" do
      @templates = Manuscript::PageTemplate.all
      @page = Page.find_by_id params[:id]
      halt 404, "Page not found" unless @page
      haml :page
    end
  
    put "/admin/pages/:id/?" do
      @page = Page.find_by_id params[:id]
      halt 404, "Page not found" unless @page
      @page.update_attributes!(params[:page])
      redirect "/admin/pages/#{@page.id}/edit"
    end
    
    delete '/admin/pages/:id' do
      @page = Page.find_by_id params[:id]
      raise Sinatra::NotFound unless @page
      @page.destroy
      redirect '/admin/pages'
    end
  end
  
end
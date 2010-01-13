module Manuscript
  class TemplateManager < Sinatra::Base
    enable :methodoverride
       
    get "/admin/templates/?" do
      @templates = PageTemplate.all
      @layouts = LayoutTemplate.all
      haml :templates
    end
    
    get "/admin/templates/new" do
      @template = PageTemplate.new
      haml :template
    end
    
    get "/admin/layouts/new" do
      @template = LayoutTemplate.new
      haml :template
    end
    
    post "/admin/templates/?" do
      @template = PageTemplate.create(params[:template])
      redirect "/admin/templates/#{@template.id}/edit"
    end
    
    post "/admin/layouts/?" do
      @template = LayoutTemplate.create(params[:template])
      redirect "/admin/templates/#{@template.id}/edit"
    end
    
    get "/admin/templates/:id/edit" do
      @template = Template.find_by_id params[:id]
      halt 404, "Template not found" unless @template
      haml :template
    end
    
    put "/admin/templates/:id/?" do
      @template = Template.find_by_id params[:id]
      halt 404, "Template not found" unless @template
      @template.update_attributes(params[:template])
      redirect "/admin/templates/#{@template.id}/edit"
    end    
  end
end

module Manuscript
  class DesignManager < Sinatra::Base
    enable :methodoverride
    
    get "/admin/design/?" do
      @templates = PageTemplate.all
      @layouts = LayoutTemplate.all
      @template_files = TemplateFile.all
      haml :design
    end
    
    get "/admin/design/templates/new" do
      @template = PageTemplate.new
      haml :template
    end
    
    get "/admin/design/layouts/new" do
      @template = LayoutTemplate.new
      haml :template
    end
    
    post "/admin/design/templates/?" do
      @template = PageTemplate.create(params[:template])
      redirect "/admin/design/templates/#{@template.id}/edit"
    end
    
    post "/admin/design/layouts/?" do
      @template = LayoutTemplate.create(params[:template])
      redirect "/admin/design/templates/#{@template.id}/edit"
    end
    
    get "/admin/design/templates/:id/edit" do
      @template = Template.find_by_id params[:id]
      halt 404, "Template not found" unless @template
      haml :template
    end
    
    put "/admin/design/templates/:id/?" do
      @template = Template.find_by_id params[:id]
      halt 404, "Template not found" unless @template
      @template.update_attributes(params[:template])
      redirect "/admin/design/templates/#{@template.id}/edit"
    end  
    
    get '/admin/design/template_files/new/?' do
      haml :new_template_file
    end

    post '/admin/design/template_files' do
      new_file = params[:template_file][:file][:tempfile]
      new_file.original_filename = params[:template_file][:file][:filename]

      @file = TemplateFile.new
      @file.file = new_file
      @file.save
      redirect '/admin/design#template_files'
    end

    get '/admin/design/template_files/:id/edit' do
      @file = TemplateFile.find(params[:id])
      haml :edit_template_file
    end

    put '/admin/design/template_files/:id' do
      new_file = params[:template_file][:file][:tempfile]
      new_file.original_filename = params[:template_file][:file][:filename]

      @file = TemplateFile.find(params[:id])
      raise Sinatra::NotFound unless @file
      @file.file = new_file
      @file.save
      redirect '/admin/design/#template_files'
    end

    delete '/admin/design/template_files/:id' do
      @file = TemplateFile.find(params[:id])
      raise Sinatra::NotFound unless @file
      @file.destroy
      redirect '/admin/design/#template_files'
    end  
  end
end

# Paperclip expects a Rails-specific ActionController::UploadedFile, so fake it with Tempfile hack
class Tempfile
  attr_accessor :original_filename
end

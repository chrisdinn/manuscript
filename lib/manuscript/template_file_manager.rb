
module Manuscript
  class TemplateFileManager < Sinatra::Base
    enable :methodoverride
    
    get '/admin/template_files/?' do
      @files = TemplateFile.all      
      haml :template_files
    end
    
    get '/admin/template_files/new/?' do
      haml :new_template_file
    end
    
    post '/admin/template_files' do
      new_file = params[:template_file][:file][:tempfile]
      new_file.original_filename = params[:template_file][:file][:filename]
      
      @file = TemplateFile.new
      @file.file = new_file
      @file.save
      redirect '/admin/template_files'
    end
    
    get '/admin/template_files/:id/edit' do
      @file = TemplateFile.find(params[:id])
      haml :edit_template_file
    end
    
    put '/admin/template_files/:id' do
      new_file = params[:template_file][:file][:tempfile]
      new_file.original_filename = params[:template_file][:file][:filename]
      
      @file = TemplateFile.find(params[:id])
      raise Sinatra::NotFound unless @file
      @file.file = new_file
      @file.save
      redirect '/admin/template_files'
    end
    
    delete '/admin/template_files/:id' do
      @file = TemplateFile.find(params[:id])
      raise Sinatra::NotFound unless @file
      @file.destroy
      redirect '/admin/template_files'
    end
  end
end

# Paperclip expects a Rails-specific ActionController::UploadedFile, so fake it with Tempfile hack
class Tempfile
  attr_accessor :original_filename
end
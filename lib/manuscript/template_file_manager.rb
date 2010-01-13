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
      #@file = TemplateFile.new
      #@file.file = params[:template_file][:file]
      #@file.save
      params.inspect
      #redirect '/admin/template_files'
    end
  end
end

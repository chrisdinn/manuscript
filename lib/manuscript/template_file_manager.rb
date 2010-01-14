
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
      puts @file.inspect
      puts params.inspect
      redirect '/admin/template_files'
    end
  end
end

class Tempfile
  attr_accessor :original_filename
end
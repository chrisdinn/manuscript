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
      @file = TemplateFile.new
      @file.attributes = params[:template_file]
      @file.save
      @file.errors.each do |e|
        puts e
      end
      puts params.inspect
      redirect '/admin/template_files'
    end
  end
end

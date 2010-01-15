require 'paperclip'

module Manuscript
  class TemplateFile < ActiveRecord::Base
    validates_presence_of :file_file_name
    
    has_attached_file :file,
        :path => "./template_files/:id/:basename.:extension",
        :url => "/template_files/:id/:basename.:extension"

    def url
      file.url
    end
  end
end

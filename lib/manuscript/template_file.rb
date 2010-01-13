require 'paperclip'

module Manuscript
  class TemplateFile < ActiveRecord::Base
    has_attached_file :file,
        :path => "/Users/Chris/src/manuscript/public/template_files/:id_partition/:basename.:extension",
        :url => "/template_files/:id_partition/:basename.:extension"
  end
end

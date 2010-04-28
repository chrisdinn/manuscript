require 'paperclip'

module Manuscript
  class TemplateFile < ActiveRecord::Base
    S3_CREDENTIALS = { :access_key_id => 'AKIAJIKDK4K3ANT2VX2A', :secret_access_key => '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', :bucket_name => 'dev-manuscript.digital-achiever.com' }
    
    validates_presence_of :file_file_name
    validates_uniqueness_of :file_file_name
    
    has_attached_file :file,
        #:url => "./template_files/:id/:basename.:extension",
        :path => "/template_files/:basename.:extension",
        :storage => :s3,
        :s3_credentials => { :access_key_id => S3_CREDENTIALS[:access_key_id], :secret_access_key => S3_CREDENTIALS[:secret_access_key] },
        :bucket => S3_CREDENTIALS[:bucket_name]

    def url
      file.url
    end
  end
end

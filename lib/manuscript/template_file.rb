require 'paperclip'
require 'yaml'

module Manuscript
  class TemplateFile < ActiveRecord::Base    
    validates_presence_of :file_file_name
    validates_uniqueness_of :file_file_name
    
    S3_CREDENTIALS = YAML.load(File.read('config/s3.yml'))
    
    has_attached_file :file,
        #:url => "./template_files/:id/:basename.:extension",
        :path => "/template_files/:basename.:extension",
        :storage => :s3,
        :s3_credentials => { :access_key_id => S3_CREDENTIALS["access_key_id"], :secret_access_key => S3_CREDENTIALS["secret_access_key"], :bucket_name => S3_CREDENTIALS["bucket_name"] },
        :bucket => S3_CREDENTIALS["bucket_name"]

    def url
      file.url
    end
  end
end

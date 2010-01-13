require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Manuscript::TemplateFileManager do
  include Rack::Test::Methods    
  
  def app
    Manuscript::TemplateFileManager
  end
  
end
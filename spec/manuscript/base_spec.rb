require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Manuscript::Base do
  include Rack::Test::Methods    
  
  def app
    Manuscript::Base
  end
  
  before do
    @page = Manuscript::Page.create!(:name => "sample", :contents => "Here are some **Sample issue contents**." ) 
  end

  it "should display rendered pages" do
    get "/#{@page.name}"
    last_response.should be_ok
    last_response.body.should == @page.to_html
  end
  
  it "should only display existing pages" do
    get "/#{@page.name.reverse}"
    last_response.should be_not_found
  end
  
  it "should only display child pages beneath their parents" do
    new_page = Manuscript::Page.create!(:name => "child", :parent_id => @page.id, :contents => "Here are some **Sample issue contents**." )
    
    get "/#{new_page.name}"
    last_response.should be_not_found
  
    get "/#{@page.name}/#{new_page.name}"
    last_response.should be_ok
  end
end

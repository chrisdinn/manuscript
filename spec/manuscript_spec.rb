require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Manuscript" do
  include Rack::Test::Methods    
  
  def app
    Manuscript
  end
  
  before do
    @page = Page.create!(:name => "sample", :contents => "Here are some **Sample issue contents**." ) 
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
end

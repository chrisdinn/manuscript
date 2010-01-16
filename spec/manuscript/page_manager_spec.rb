require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "PageManager" do
  include Rack::Test::Methods    
  
  def app
    Manuscript::PageManager
  end
  
  describe "when there are two pages" do
    before do
      @pages = Manuscript::Page.create([{:name => "index", :contents => "Page 1"}, {:name => "contact", :contents => "Page 2"}])
    end
  
    it "should display list with both pages" do
      get "/admin/pages"
      
      last_response.should be_ok
      last_response.body.should include("index")
      last_response.body.should include("contact")
    end
    
    it "should allow new page to be created" do
      get "/admin/pages/new"
      last_response.should be_ok
      
      post "/admin/pages", :page => { :name => "new-page", :contents => "New page contents"  }
      last_response.should be_redirect
      follow_redirect!
      last_response.should be_ok
      last_response.body.should include("New page contents")
    end
    
    it "should allow pages to be edited" do
      page = Manuscript::Page.first
      get "/admin/pages/#{page.id}/edit"
      last_response.should be_ok
      last_response.body.should include(page.contents)
      
      put "/admin/pages/#{page.id}", :page => { :contents => "Changed page contents" }
      last_response.should be_redirect
      follow_redirect!
      last_response.should be_ok
      last_response.body.should include("Changed page contents")
    end
  end  
  
end
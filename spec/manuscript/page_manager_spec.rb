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
      request "/admin/pages"
      
      last_response.should be_ok
      last_response.body.should include("index")
      last_response.body.should include("contact")
    end
    
    it "should allow new page to be created" do
      get "/admin/pages/new"
      last_response.should be_ok
      
      test_time = (Time.now - 1.day).to_s
      post "/admin/pages", :page => { :name => test_time, :contents => test_time  }
      last_response.should be_redirect
      follow_redirect!
      last_response.should be_ok
      last_response.body.should include(test_time)
    end
    
    it "should allow pages to be edited" do
      page = Manuscript::Page.first
      get "/admin/pages/#{page.id}/edit"
      last_response.should be_ok
      last_response.body.should include(page.contents)
      
      test_time = Time.now.to_s
      put "/admin/pages/#{page.id}", :page => { :contents => test_time }
      last_response.should be_redirect
      follow_redirect!
      last_response.should be_ok
      last_response.body.should include(test_time)
    end
  end  
  
end
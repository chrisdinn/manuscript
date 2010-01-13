require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Manuscript::TemplateManager do
   include Rack::Test::Methods    

   def app
     Manuscript::TemplateManager 
   end

   describe "when there are templates and layouts" do
      before do
        Manuscript::PageTemplate.create([{:name => "Template 1"}, {:name => "Template 2"}])
        Manuscript::LayoutTemplate.create([{:name => "Layout 1"}, {:name => "Layout 2"}])
      end
  
      it "should display list with both templates and both layouts" do
        get "/admin/templates"
        last_response.should be_ok
        last_response.body.should include("Template 1")
        last_response.body.should include("Template 2")
        last_response.body.should include("Layout 1")
        last_response.body.should include("Layout 2")
      end
    
      it "should allow new template to be created" do
        get "/admin/templates/new"
        last_response.should be_ok
      
        post "/admin/templates", :template => { :name => "New template" }
        last_response.should be_redirect
        follow_redirect!
        last_response.should be_ok
        last_response.body.should include("New template")
      end
    
      it "should allow new layout to be created" do
        get "/admin/layouts/new"
        last_response.should be_ok
      
        post "/admin/layouts", :template => { :name => "New layout" }
        last_response.should be_redirect
        follow_redirect!
        last_response.body.should include("New layout")
      end
    
      it "should allow templates to be edited" do
        template = Manuscript::Template.first
        get "/admin/templates/#{template.id}/edit"
        last_response.should be_ok
        last_response.body.should include(template.name)
      
        put "/admin/templates/#{template.id}", :template => { :name => "My new template" }
        last_response.should be_redirect
        follow_redirect!
        last_response.should be_ok
        last_response.body.should include("My new template")
      end
   end
  
end
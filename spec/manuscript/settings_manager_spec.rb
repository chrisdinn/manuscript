require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "SettingsManager" do
  include Rack::Test::Methods    
  
  def app
    Manuscript::SettingsManager
  end
  
  it "should show an edit form" do
    get '/admin/settings'
    last_response.should be_ok
  end
  
  it "should update settings" do
    post '/admin/settings', :settings => { :site_name => "sample-page.com" }
    last_response.should be_ok
    Manuscript::Settings.new('settings.yml')[:site_name].should == "sample-page.com"
  end
  
end
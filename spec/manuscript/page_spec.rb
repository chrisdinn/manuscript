require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Manuscript::Page do  
  
  it { should validate_presence_of(:name) }
  
  it "should create a page with valid attributes" do
    page = Manuscript::Page.create!(:name => 'words', :contents => 'we got em')
  end

  it "should render Markdown contents as html" do
    page = Manuscript::Page.create!(:name => 'words', :contents => 'we **got** em')
    page.to_html.should == RDiscount.new('we **got** em').to_html
  end
end

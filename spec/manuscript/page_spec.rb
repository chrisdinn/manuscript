require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Manuscript::Page do  
  
  subject { Manuscript::Page.create!(:name => 'words', :contents => 'we got em') }
  
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should belong_to(:template) }
  
  describe "rendering a page as HTML" do
    before do
      @page = Manuscript::Page.create!(:name => 'words', :contents => 'we **got** em')
    end
    
    describe "when the page has no template" do
      it "should render its contents as html directly" do
        @page.to_html.should == RDiscount.new(@page.contents).to_html
      end
    end
  
    describe "when the page has a template" do
      it "should render its content inside the appropriate template" do
        @page.template = Manuscript::Template.new(:name =>"Test template", :code => "<h1>Hello templaters!</h1> {{ contents }}" )
        @page.to_html.should == Liquid::Template.parse(@page.template.code).render({'contents' => RDiscount.new(@page.contents).to_html})
      end
    end
  end

end

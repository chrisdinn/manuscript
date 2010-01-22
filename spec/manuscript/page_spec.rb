require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Manuscript::Page do  
  
  subject { Manuscript::Page.create!(:name => 'words', :contents => 'we got em') }
  
  it { should belong_to(:parent) }
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:name) }
  it { should belong_to(:template) }
  
  it "should identify top-level pages" do
    page1 = Manuscript::Page.create!(:name => 'top-level1', :contents => 'we got it')
    page2 = Manuscript::Page.create!(:name => 'top-level2', :contents => 'we got it')
    child1 = Manuscript::Page.create!(:name => 'child1', :contents => 'we got it', :parent => page1)
    child2 = Manuscript::Page.create!(:name => 'child2', :contents => 'we got it', :parent => page1)
    grandchild1 = Manuscript::Page.create!(:name => 'grandchild2', :contents => 'we got it', :parent => child1)
    
    Manuscript::Page.main_pages.should include(page1)
    Manuscript::Page.main_pages.should include(page1)
    Manuscript::Page.main_pages.should_not include(child1)
    Manuscript::Page.main_pages.should_not include(child2)
    Manuscript::Page.main_pages.should_not include(grandchild1)
  end
  
  it "should know what it's child pages are" do
    parent1 = Manuscript::Page.create!(:name => 'top-level1', :contents => 'we got it')
    parent2 = Manuscript::Page.create!(:name => 'top-level2', :contents => 'we got it')
    child1 = Manuscript::Page.create!(:name => 'child1', :contents => 'we got it', :parent => parent1)
    child2 = Manuscript::Page.create!(:name => 'child2', :contents => 'we got it', :parent => parent1)
    grandchild1 = Manuscript::Page.create!(:name => 'grandchild2', :contents => 'we got it', :parent => child1)
    
    parent1.child_pages.should include(child1)
    parent1.child_pages.should include(child2)

    parent1.child_pages.should_not include(parent2)
    parent1.child_pages.should_not include(grandchild1)
  end

  it "should know it's url" do
    page1 = Manuscript::Page.create!(:name => 'some', :contents => 'we got em') 
    page2 = Manuscript::Page.create!(:name => 'things', :contents => 'we got em', :parent => page1) 
    page3 = Manuscript::Page.create!(:name => 'youneed', :contents => 'we got em', :parent => page2)
    
    page1.url.should == "/some"
    page3.url.should == "/some/things/youneed"
  end
  
  it "should find child pages by path" do
    page1 = Manuscript::Page.create!(:name => 'one', :contents => 'we got one') 
    page2 = Manuscript::Page.create!(:name => 'two', :contents => 'we got two', :parent => page1) 
    page3 = Manuscript::Page.create!(:name => 'three', :contents => 'we got three', :parent => page2)
    
    Manuscript::Page.find_by_path("#{page1.name}").should == page1
    Manuscript::Page.find_by_path("#{page1.name}/#{page2.name}").should == page2
    Manuscript::Page.find_by_path("#{page1.name}/#{page2.name}/#{page3.name}").should == page3
  end
  
  it "should restrict names to uri-friendly strings" do
    should allow_value('page-name').for(:name)
    should allow_value('page1name').for(:name)
    should_not allow_value('page#name').for(:name)
    should_not allow_value('page name').for(:name)
    should_not allow_value('page/name').for(:name)
  end
  
  describe "rendering a page as HTML" do
    before do
      @page = Manuscript::Page.create!(:name => 'words', :contents => 'we **got** em')
    end
    
    context "when the page has no template" do
      it "should render its contents as html directly" do
        @page.to_html.should == RDiscount.new(@page.contents).to_html
      end
    end
  
    context "when the page has a template" do
      it "should render its content inside the appropriate template" do
        @page.template = Manuscript::Template.new(:name =>"Test template", :code => "<h1>Hello templaters!</h1> {{ contents }}" )
        @page.to_html.should == Liquid::Template.parse(@page.template.code).render({'contents' => RDiscount.new(@page.contents).to_html})
      end
    end
  end
end

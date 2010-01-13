require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Manuscript::PageTemplate do
  before do
    @template = Manuscript::PageTemplate.new(:name =>"Test template", :code => "<h1>Hello templaters!</h1> {{ contents }}" )
  end
  
  it { should validate_presence_of(:name) }
  it { should belong_to(:layout) }
  
  it "should render itself with contents if no layout provided" do
    options = {'contents' => "I'll show you some page contents"}
    @template.render(options).should == Liquid::Template.parse(@template.code).render(options)
  end
  
  it "should render itself with contents AND layout if layout is provided" do
    @layout = Manuscript::LayoutTemplate.new(:name => "Layout test", :code => "<h1> Laid out!</h1> {{ contents }}")
    options = {'contents' => "I'll show you some page contents"}
    @template.layout = @layout
    
    @template.render(options).should == Liquid::Template.parse(@layout.code).render({'contents' => Liquid::Template.parse(@template.code).render(options)})
  end
end
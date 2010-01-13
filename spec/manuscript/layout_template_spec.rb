require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Manuscript::LayoutTemplate do
  before do
    @template = Manuscript::LayoutTemplate.new(:name =>"Test template", :code => "<h1>Hello templaters!</h1> {{ contents }}" )
  end
  
  it { should validate_presence_of(:name) }
  
  it "should render itself with appropriate options" do
    options = {'contents' => "I'll show you some page contents"}
    @template.render(options).should == Liquid::Template.parse(@template.code).render(options)
  end
end
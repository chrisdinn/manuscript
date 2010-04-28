require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Manuscript::Settings do
  
  it "should load settings from file" do
    @settings = Manuscript::Settings.new('settings.yml')
    @settings.to_hash.should == {}  
    @settings.settings_file_name.should eql('settings.yml')
  end
  
  it "should save settings to file" do
    @settings = Manuscript::Settings.new('settings.yml')
    test_time = Time.now.to_s
    @settings[:test_time] = test_time
    @settings.save
    Manuscript::Settings.new('settings.yml')[:test_time].should eql(test_time)
  end
  
end
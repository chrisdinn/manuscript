module Manuscript
  class Settings
    attr_reader :settings_file_name, :settings

    def initialize(filename)
      @settings = Hash.new
      @settings_file_name = filename
      settings = YAML::load(File.new(@settings_file_name).read)
      @settings.update(settings) if settings.is_a? Hash 
    end
    
    def [](key)
      return @settings[key]
    end
    
    def []=(key, value)
      @settings[key] = value
    end
    
    def to_hash
      return @settings
    end
    
    def save
      File.open(@settings_file_name,'w') do |file|
        file << YAML::dump(@settings)
      end
    end
  end
end

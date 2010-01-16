require 'rdiscount'

module Manuscript 

  class Page < ActiveRecord::Base
    belongs_to :template
    
    validates_presence_of :name
    validates_uniqueness_of :name
    validates_format_of :name, :with => /^[-a-zA-Z0-9]+$/
  
    def to_html
      if template
        template.render({'contents' => RDiscount.new(contents).to_html})
      else  
        RDiscount.new(contents).to_html
      end
    end
  end
  
end
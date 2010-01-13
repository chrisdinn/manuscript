require 'rdiscount'

module Manuscript 

  class Page < ActiveRecord::Base
    belongs_to :template
    
    validates_presence_of :name
    validates_uniqueness_of :name
  
    def to_html
      if template
        template.render({'contents' => RDiscount.new(contents).to_html})
      else  
        RDiscount.new(contents).to_html
      end
    end
  end
  
end
require 'rdiscount'

module Manuscript 

  class Page < ActiveRecord::Base
    validates_presence_of(:name)
  
    def to_html
      RDiscount.new(contents).to_html
    end
  end
  
end
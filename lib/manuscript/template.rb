require 'liquid'

module Manuscript 
  class Template < ActiveRecord::Base
    validates_presence_of :name
    
    def render(options)
      Liquid::Template.parse(code).render(options)
    end
    
    def layout?
      self.kind_of? Manuscript::LayoutTemplate
    end
  end
end
require 'rdiscount'

module Manuscript 

  class Page < ActiveRecord::Base
    belongs_to :template
    
    validates_presence_of :name
    validates_uniqueness_of :name
    validates_format_of :name, :with => /^[-a-zA-Z0-9]+$/
    
    belongs_to :parent, :class_name => "Page"
    has_many :child_pages, :class_name => "Page", :foreign_key => "parent_id"
    named_scope :main_pages, :conditions => { :parent_id => nil }
  
    def url
      if parent
        "#{parent.url}/#{name}"
      else
        "/#{name}"
      end
    end
    
    def parent_url
      if parent
        parent.url
      else
        ""
      end
    end
    
    def to_html(user = nil)
      if template
        template.render({'current_user' => user, 'contents' => RDiscount.new(contents).to_html})
      else  
        RDiscount.new(contents).to_html
      end
    end
  end
  
end
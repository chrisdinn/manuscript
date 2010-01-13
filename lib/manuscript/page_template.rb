module Manuscript 
  class PageTemplate < Template
    belongs_to :layout, :class_name => "LayoutTemplate"
    
    def render(options)
      if layout
        layout.render({ 'contents' => super(options) })
      else
        super(options)
      end
    end
  end
end
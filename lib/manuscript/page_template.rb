module Manuscript 
  class PageTemplate < Template
    belongs_to :layout, :class_name => "LayoutTemplate"
    
    def render(options)
      if layout
        layout.render({ 'current_user' => options['current_user'], 'contents' => super(options) })
      else
        super(options)
      end
    end
  end
end
require 'rdiscount'

class Page < ActiveRecord::Base
  validates_presence_of(:name)
  validates_format_of :name, :with => /[A-Za-z0-9._%+-]/, :message => 'can only letters, numbers, or select punctuation (".", "+", "-", "_", or "%")'
  
  def to_html
    RDiscount.new(contents).to_html
  end
end
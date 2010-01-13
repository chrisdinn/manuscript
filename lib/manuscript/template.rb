module Manuscript 

  class Template < ActiveRecord::Base
    validates_presence_of :name
  end
  
end
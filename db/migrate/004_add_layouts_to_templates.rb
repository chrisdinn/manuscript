class AddLayoutsToTemplates < ActiveRecord::Migration
  def self.up
    add_column "templates", "type", "string"
    add_column "templates", "layout_id", "integer"
  end

  def self.down
    remove_column "templates", "type"
    remove_column "templates", "layout_id"
  end
end
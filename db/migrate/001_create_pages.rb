class CreatePages < ActiveRecord::Migration
  def self.up
    create_table "pages" do |t|
      t.string   "name"
      t.text     "contents"
    end
  end

  def self.down
    drop_table "templates"
  end
end
class Fixes < ActiveRecord::Migration
  def self.up
    add_column(:items, :pdf_title, :string)
    add_column(:items, :gallery_text, :text)
  end

  def self.down
    remove_column(:items, :pdf_title)
    remove_column(:items, :gallery_text)
  end
end

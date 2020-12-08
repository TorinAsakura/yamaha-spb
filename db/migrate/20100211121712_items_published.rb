class ItemsPublished < ActiveRecord::Migration
  def self.up
 #   add_column(:items, :published, :boolean)
  end

  def self.down
    remove_column(:items, :published)
  end
end

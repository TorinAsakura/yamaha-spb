class AddPageIdToNews < ActiveRecord::Migration
  def self.up
    add_column :posts, :page_id, :integer
    add_column :banners, :page_id, :integer
  end

  def self.down
   remove_column :banners, :page_id, :integer
    remove_column :posts, :page_id
  end
end

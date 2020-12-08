class AddTitleToAlbums < ActiveRecord::Migration
  def self.up
    add_column :albums, :title, :string
  end

  def self.down
    remove_column :albums, :title
  end
end

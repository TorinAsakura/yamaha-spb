class AddImageToAlbumPhotos < ActiveRecord::Migration
  def self.up
    add_column :album_photos, :image_file_name, :string
  end

  def self.down
    remove_column :album_photos, :image_file_name
  end
end

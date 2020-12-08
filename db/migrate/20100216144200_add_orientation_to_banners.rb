class AddOrientationToBanners < ActiveRecord::Migration
  def self.up
    add_column :banners, :orientation, :string
  end

  def self.down
    remove_column :banners, :orientation
  end
end

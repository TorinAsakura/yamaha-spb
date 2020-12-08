class ItemBanner < ActiveRecord::Migration
  def self.up
    #add_column(:items, :banner_file_name, :string)
    #add_column(:items, :banner_link, :string)
    add_column(:photos, :color_title, :string)
  end

  def self.down
    remove_column(:items, :banner_file_name)
    remove_column(:items, :banner_link)
    remove_column(:photos, :color_title)
    
  end
end

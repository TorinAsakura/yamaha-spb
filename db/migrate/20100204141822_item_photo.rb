class ItemPhoto < ActiveRecord::Migration
  def self.up
    add_column(:items, :image_file_name, :string)
    add_column(:items, :image_file_size, :integer)
    add_column(:items, :image_content_type, :string)
  end

  def self.down
    remove_column(:items, :image_file_name)
    remove_column(:items, :image_file_size)
    remove_column(:items, :image_content_type)
  end
end

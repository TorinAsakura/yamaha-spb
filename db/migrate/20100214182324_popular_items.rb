class PopularItems < ActiveRecord::Migration
  def self.up
    add_column(:items, :popular, :boolean)
  end

  def self.down
    remove_column(:items, :popular)
  end
end

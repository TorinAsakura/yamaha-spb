class AddUniversalToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :universal, :boolean
  end

  def self.down
    remove_column :items, :universal
  end
end

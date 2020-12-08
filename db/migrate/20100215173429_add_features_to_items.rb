class AddFeaturesToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :features, :text
  end

  def self.down
    remove_column :items, :features
  end
end

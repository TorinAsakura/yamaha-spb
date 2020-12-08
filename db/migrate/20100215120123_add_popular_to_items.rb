class AddPopularToItems < ActiveRecord::Migration
  def self.up
    #add_column :items, :popular, :boolean
    add_column :items, :new, :boolean
  end

  def self.down
    remove_column :items, :new
    #remove_column :items, :popular
  end
end

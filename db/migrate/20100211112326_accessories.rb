class Accessories < ActiveRecord::Migration
  def self.up
#    create_table :vendors do |t|
#      t.string :title
#    end
    #add_column(:items, :vendor, :string)
  end

  def self.down
    remove_column(:items, :vendor)
#    drop_table :vendors
  end
end

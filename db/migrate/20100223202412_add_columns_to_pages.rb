class AddColumnsToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :lft, :integer
    add_column :pages, :rgt, :integer
  end

  def self.down
    remove_column :pages, :rgt
    remove_column :pages, :lft
  end
end

class AddRealTitleToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :page_title, :string
  end

  def self.down
    remove_column :pages, :page_title
  end
end

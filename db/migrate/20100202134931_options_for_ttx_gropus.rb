class OptionsForTtxGropus < ActiveRecord::Migration
  def self.up
    add_column(:ttx_groups, :no_options, :boolean)
  end

  def self.down
    remove_column(:ttx_groups, :no_options)
  end
end

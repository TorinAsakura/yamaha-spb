class CreateVideos < ActiveRecord::Migration
  def self.up
    create_table :videos do |t|
      t.integer :page_id
      t.string :url

      t.timestamps
    end
  end

  def self.down
    drop_table :videos
  end
end

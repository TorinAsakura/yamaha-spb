class DbVer01 < ActiveRecord::Migration
  # This file is auto-generated from the current state of the database. Instead of editing this file, 
  # please use the migrations feature of Active Record to incrementally modify your database, and
  # then regenerate this schema definition.
  #
  # Note that this schema.rb definition is the authoritative source for your database schema. If you need
  # to create the application database on another system, you should be using db:schema:load, not running
  # all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
  # you'll amass, the slower it'll run and the greater likelihood for issues).
  #
  # It's strongly recommended to check this file into your version control system.

  ActiveRecord::Schema.define(:version => 20100201131042) do

    create_table "banners", :force => true do |t|
      t.string   "image_file_name"
      t.string   "image_file_size"
      t.string   "image_content_type"
      t.string   "title"
      t.string   "url"
      t.string   "caption"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "item_ttxes", :force => true do |t|
      t.integer  "item_id"
      t.integer  "ttx_id"
      t.string   "value"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "items", :force => true do |t|
      t.integer  "page_id"
      t.text     "price"
      t.string   "swf_file_name"
      t.string   "swf_file_size"
      t.string   "swf_content_type"
      t.string   "video_file_name"
      t.string   "video_file_size"
      t.string   "video_content_type"
      t.text     "description"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.string   "youtube_video"
      t.string   "swf_url"
      t.text     "review"
      t.string   "title"
      t.string   "price_description"
      t.boolean  "test_drive"
      t.string   "pdf_file_name"
      t.integer  "pdf_file_size"
      t.string   "pdf_content_type"
    end

    create_table "pages", :force => true do |t|
      t.integer  "parent_id"
      t.string   "title"
      t.string   "permalink"
      t.boolean  "published"
      t.text     "content"
      t.string   "template"
      t.datetime "created_at"
      t.datetime "updated_at"
      t.integer  "position"
      t.boolean  "left_menu"
      t.boolean  "top_menu"
      t.boolean  "underlined"
    end

    create_table "photos", :force => true do |t|
      t.integer  "item_id"
      t.string   "asset_file_name"
      t.string   "asset_content_type"
      t.integer  "asset_file_size"
      t.datetime "asset_updated_at"
      t.string   "color"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "posts", :force => true do |t|
      t.string   "title"
      t.text     "content"
      t.boolean  "publish"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "related_items", :force => true do |t|
      t.integer "item_id"
      t.integer "related_item_id"
    end

    create_table "taggings", :force => true do |t|
      t.integer  "tag_id"
      t.integer  "taggable_id"
      t.string   "taggable_type"
      t.datetime "created_at"
    end

    add_index "taggings", ["tag_id"], :name => "index_taggings_on_tag_id"
    add_index "taggings", ["taggable_id", "taggable_type"], :name => "index_taggings_on_taggable_id_and_taggable_type"

    create_table "tags", :force => true do |t|
      t.string "name"
    end

    create_table "ttx_groups", :force => true do |t|
      t.integer  "page_id"
      t.string   "title"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "ttxes", :force => true do |t|
      t.integer  "ttx_group_id"
      t.string   "title"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    create_table "users", :force => true do |t|
      t.string   "username"
      t.string   "email"
      t.string   "password_hash"
      t.string   "password_salt"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

  end

end

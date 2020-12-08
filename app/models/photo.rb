require 'mime/types'
class Photo < ActiveRecord::Base
  has_attached_file :asset, :url => '/assets/items/:id/:style/:basename.:extension',
  :path => ":rails_root/public/assets/items/:id/:style/:basename.:extension",
  :styles => { :big => "1024x768", :preview => "540x360", :medium => "300x300>", :thumb => "100x100#", :equip => "400x400" }
  validates_attachment_presence :asset
  validates_attachment_size :asset, :less_than => 5.megabytes
 # validates_attachment_content_type :asset, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  cattr_reader :per_page
  @@per_page = 1
  
  def swfupload_file=(data)
    data.content_type = MIME::Types.type_for(data.original_filename).to_s
    self.asset = data
  end
end

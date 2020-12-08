class Banner < ActiveRecord::Base
  belongs_to :page
  has_attached_file :image
  validates_attachment_presence :image
end

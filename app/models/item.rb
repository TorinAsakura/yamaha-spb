class Item < ActiveRecord::Base
#  has_many :ttx_groups
  belongs_to :page
  
  has_many :item_ttxes, :dependent => :destroy
  has_many :ttxes, :through => :item_ttxes
  has_many :ttx_groups, :through => :ttxes
  has_many :related_items
  belongs_to :related_item
  has_many :gallery_photos, :class_name => "Photo", :conditions => "color is NULL"
  has_many :colour_photos, :class_name => "Photo", :conditions => "color is NOT NULL"
  
  has_attached_file :image
#  validates_attachment_presence :image
  #validates_attachment_content_type :image, :less_than => 5.megabytes
  #validates_attachment_size :image, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  
  has_attached_file :video
  has_attached_file :swf
  has_attached_file :banner
  #validates_attachment_size :swf, :less_than => 5.megabytes
  #validates_attachment_content_type :swf, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  has_attached_file :pdf
  #validates_attachment_size :pdf, :less_than => 5.megabytes
  #validates_attachment_content_type :pdf
  
  #validates_presence_of :title, :if => lambda { |item| item.published }
  validates_presence_of :title, :on => :update
  validates_presence_of :page, :on => :update
  
  
  accepts_nested_attributes_for :gallery_photos, :reject_if => lambda { |a| a[:asset].blank? }
  accepts_nested_attributes_for :colour_photos, :reject_if => lambda { |a| a[:asset].blank? }
  accepts_nested_attributes_for :item_ttxes, :reject_if => lambda { |a| a[:value].blank? }, :allow_destroy => true
  
end

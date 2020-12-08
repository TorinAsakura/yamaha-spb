class TtxGroup < ActiveRecord::Base
  belongs_to :page
  has_many :ttxes
  named_scope :with_no_options, :conditions => {:no_options => true}
  
  validates_presence_of :title, :page_id
  validates_uniqueness_of :title, :scope => :page_id
end

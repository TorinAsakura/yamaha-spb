class Ttx < ActiveRecord::Base
#  belongs_to :item_ttes
  belongs_to :ttx_group
  has_many :item_ttxes
  
  validates_presence_of :title, :ttx_group_id
  validates_uniqueness_of :title, :scope => :ttx_group_id
end

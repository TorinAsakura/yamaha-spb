class ItemTtx < ActiveRecord::Base
  belongs_to :item
  belongs_to :ttx
  
  validates_presence_of :value, :item_id
end
  
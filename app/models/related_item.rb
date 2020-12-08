class RelatedItem < ActiveRecord::Base
  has_many :items
  belongs_to :item
  validates_presence_of :item_id, :related_item_id
end

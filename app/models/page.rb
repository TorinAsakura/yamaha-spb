class Page < ActiveRecord::Base
  acts_as_nested_set
  has_many :items
  has_many :posts
  has_many :ttx_groups
  has_many :banners
  has_many :ttxes, :through => :ttx_groups

  #validates_presence_of :title, :content, :message => "^Поля, помеченные звездочкой (*) должны быть заполнены!"
  validates_numericality_of :parent_id, :on => :create
  validates_presence_of :title, :permalink
  sortable :scope => :parent_id
  
  def full_permalink
  link = []
  self.self_and_ancestors.each do |p|
    link << p.permalink
  end
#    page = self
#    link = []
#    link << page.permalink
#    while(page.parent_id != 0)
#      link << page.parent.permalink
#      page = page.parent
#    end
    return link.join("/")
  end
  
  def path_name
    "#{'-' * self.level} #{self.name}"
  end
end

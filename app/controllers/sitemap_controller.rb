class SitemapController < ApplicationController

  
  def index
    
    
    @pages = Page.find(:all, :conditions => {:published => true, :parent_id => nil})
    @pages.unshift(Page.new(:title => "Главная страница"))
  end
end

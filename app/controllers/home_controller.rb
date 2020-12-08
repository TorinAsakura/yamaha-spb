class HomeController < ApplicationController
  def index
    @news = Post.find(:all, :include => :page, :conditions => "posts.page_id = pages.id AND pages.permalink='news'", :limit => 3, :order => "posts.created_at DESC")
    @banners = Banner.find(:all, :conditions => "page_id IS NULL OR page_id=0")
  end
end

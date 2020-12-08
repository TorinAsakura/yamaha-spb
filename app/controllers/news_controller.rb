class NewsController < ApplicationController
  
  def index
    
    if params[:controller] == 'news'
      @page = Page.find_by_permalink('news')
    else 
      @page = page.find_by_permalink('news')
    end
    
    unless params[:year]
      @posts = Post.paginate :conditions => ["page_id=?", @page.id], :page => params[:page], :order => 'created_at DESC'
    else 
      @posts = Post.paginate :conditions => ["YEAR(created_at)=?", params[:year]], :page => params[:page], :order => 'created_at DESC'
    end
    @years = Post.find(:all, :select => "YEAR(created_at) AS year", :group => "year")

    
#    render :text => params.to_xml
  end
  
  def show
    #@page = Page.find_by_permalink('news')
    @post = Post.find(params[:id])
    @page = @post.page
    @related_posts = Post.find_tagged_with(@post.tag_list)
  end
  
end

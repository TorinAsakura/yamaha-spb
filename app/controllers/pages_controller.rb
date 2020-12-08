class PagesController < ApplicationController
  
  layout nil, :except => :show
  layout "application", :only => :show
  def show
    
    @page = Page.find_by_permalink(params[:path].last)
    redirect_to '/404.html' unless @page
    #case @page.permalink
    #when 'shop': redirect_to :controller => 'store'
    #when 'news': redirect_to :controller => 'news'
    #else render
    #end 
  end
  
  def print_contacts

  end
end

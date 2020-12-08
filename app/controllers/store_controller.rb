require 'youtube_g'
class StoreController < ApplicationController
  
  def index
    @categories = Page.find(:all, :conditions => {"parent_id = ?", params[:id]}, :order => "position ASC")
    
  end
  
  def show
    @path = params[:path]
    @last = @path.last
    @page = Page.find_by_permalink(@last)
    if @page
      @childs = Page.find(:all, :conditions => {:parent_id => @page.id}, :order => "position ASC")
      if @childs.length > 0
        #@childs.each do |c|
         # if c.children.length > 0
          #  c.each do |cc|
              
          #  end
      #  end
        render :template => "store/list.rhtml"  
      else
        @items = Item.find(:all, :conditions => {:page_id => @page.id})
        render :template => "store/items.rhtml"
      end
    else
      @item = Item.find(@last)
      @page = @item.page
      unless params[:show]
        if @item.review.size > 0
            params[:show] = 'review'
        elsif @item.youtube_video || @item.swf_url || @item.gallery_photos || @item.colour_photos
            params[:show] = 'know_more' 
        elsif @item.item_ttxes
            params[:show] = 'tech_info'
        elsif @item.related_items
            params[:show] = 'accessories' 
        end
      end
      @tabs = 0
      @tabs += 1 if @item.youtube_video.length > 0
      @tabs += 1 if @item.swf_url.length > 0
      @tabs += 1 if @item.gallery_photos.length > 0
      @tabs += 1 if @item.colour_photos.length > 0
      case params[:show]
      when 'review':
      when 'media':
        
       
        
      end
      unless params[:show]=='accessories'
      
      render :template => "store/item"
      else 
        @accessories_ids = RelatedItem.find(:all, :select => :item_id, :conditions => {:related_item_id => @item.id}, :group => :item_id)
        @accessories = []
        @pages = []
        @parent_pages = []
        @item_ids = []
        @item_page_ids = []
        #render :text => @accessories_ids.to_xml
        @accessories_ids.each do |item|
        # @item_ids.include?
          @item_ids << item.item_id
          #@accessories << @item
        end
        
        @equip_page = Page.find_by_permalink("accessories")
        
        if params[:cat]
           @accessory_page = Page.find_by_id(params[:cat])
           @accessory_page.children.each do |x|
               @item_page_ids << x.id
           end
        end
      
        if @item_page_ids
          @accessories = Item.paginate :conditions => {:id => @item_ids}, :page => params[:page]
        else
          @accessories = Item.paginate :conditions => {:id => @item_ids, :page_id => @item_page_ids}, :page => params[:page]
        end
        
        @accessories.each do |item|
          if item.page && item.page.parent && item.page.parent.parent
          unless @parent_pages.include? item.page.parent.parent
            @parent_pages << item.page.parent.parent
          end
	  end
        end

    
        render :template => "store/accessories"
      end
    end
    
  end
  
  
end

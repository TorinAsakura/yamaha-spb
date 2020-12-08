class EquipController < ApplicationController
  
  before_filter :find_page, :except => [:list_vendors, :equip_types, :vendors]
  
  def index
    #@categories = Page.find(:all, :conditions => {"parent_id = ?", params[:id]})
    #@page = @equip_page = Page.find(:first, :conditions => {:template => "equip", :parent_id => "0"})
#    @news = Post.find(:all, :conditions => {:page_id => @page.id})
    @page = @equip_page
  end
  
  def show
    
 
    begin
    @item = Item.find(params[:path].last)
    rescue
    end
    if @item
    @page = @item.page
    @photos = Photo.paginate :page => params[:page], :conditions => {:item_id => @item.id}
    @photo = @photos.first

    render :template => "equip/item"
    else
    
      @page_ids = []
      @page.self_and_descendants.each do |d|
        @page_ids << d.id
      end
    
      unless params[:related_item_id]
        @universal = params[:universal]? true : false
        if params[:universal]
          @items = Item.paginate :page => params[:page], :conditions => {:page_id => @page_ids, :universal => @universal}
        else
          @items = Item.paginate :page => params[:page], :conditions => {:page_id => @page_ids}
        end
      else
        
        @items = Item.paginate :include => "related_items", :page => params[:page], :conditions => {:page_id => @page_ids, "related_items.related_item_id" => params[:related_item_id]}
      end
       
      @related_item_ids = []
      @cat_items = Item.find(:all, :conditions => {:page_id => @page_ids})
      @cat_items.each do |item|
        @rel_items = RelatedItem.find_all_by_item_id(item.id)
        @rel_items.each do |ritem|
          @related_item_ids << ritem.related_item_id
        end
      end
      @related_items = Item.find_all_by_id(@related_item_ids)
      
      render :template => "equip/show"
    end
    #render :text => @items.to_xml
    #if @page
    #item page
    #else
    #  page = @page
    #  while @page.children
        
    #  end
    #end
=begin    
    case @lvl
    when 1:
      render :template => "equip/categories.rhtml"
    when 2:
      @page = Page.find(:first, :conditions => {:permalink => params[:path].last, :template => "equip"})
      opts = []
      opts << "pages.template='equip' AND pages.id=items.page_id AND items.published = true"
      opts << "items.vendor = '#{params[:vendor]}'" if params[:vendor] 
      opts << "items.page_id = '#{params[:cat]}'" if params[:cat]
      #if opts
        @items = Item.find(:all, :include => :page, :conditions => opts)
 #       render :text => @items.to_xml
      #else
       # @items = Page.find(:all, :conditions)
      #end
#      render :template => "equip/show.rhtml"
    when 4:
      @item = Item.find(params[:path].last)
      @page = @item.page
      @photos = Photo.paginate(:all, :conditions => {:item_id => @item.id}, :page => params[:page])
      @photo = @photos.first
       render :template => "equip/item" #SHOW ITEM
    end
=end   
    
  end
  
  def list_vendors
    @vendors = Item.find(:all, :select => "items.vendor", :group => "items.vendor")
    html = ""
    @vendors.each do |vendor|
     html << "<li><a href='#'>"+vendor.vendor+"</a></li>" if vendor.vendor
    end
    render :update do |page|
      page[:vendors].replace_html html
    end
  end
  
  def equip_types
    @page = Page.find(:first, :conditions => {:template => "equip", :permalink => params[:id]})
    @pages = @page.children if @page
    html = ""
    @pages.each do |page|
     html << "<option value='#{page.permalink}'>#{page.title}</option>"
    end
    render :text => html
  end
  
  def vendors
    #@vendors = Item.find(:all, :include => :page, :select => "vendor", :group => "vendor", :conditions => {"pages.permalink" => params[:id]})
    @page = Page.find_by_permalink(params[:id])
    
    @vendors = @page.items.find(:all, :select => "vendor", :group => "vendor")
    html = ""
    @vendors.each do |vendor|
      html << "<option value='#{vendor.vendor}'>"+vendor.vendor+"</option>" if vendor.vendor
    end
    render :text => html
  end
  
  protected
  
  def find_page
#    @equip_page = Page.find(:first, :conditions => {:template => "equip", :parent_id => "0"})
    @equip_page = Page.find_by_permalink("accessories")
    @page = Page.find_by_permalink(params[:path].last) if params[:path]
    #@lvl = params[:path].size
  end

end

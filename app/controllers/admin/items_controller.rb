class Admin::ItemsController < ApplicationController
  layout "admin"
  before_filter :find_item, :only => [:show, :edit, :update, :destroy]
  auto_complete_for :ttx_group, :title, :group => "title"
  auto_complete_for :ttx, :title, :group => "title"
 # def auto_complete_for_ttx_group_title
 # end
  # GET /items
  # GET /items.xml
  def index
    unless params[:type]
      @page = Page.find_by_permalink("production", :order => "position ASC")
      #@page_ids = []
    else
      @page = Page.find_by_permalink("accessories", :order => "position ASC")
      #@items = Item.find_by_page_id(params[:page_id])
    end

    #respond_to do |wants|
   #   wants.html # index.html.erb
   # #  wants.xml  { render :xml => @items }
  #  end
  end

  # GET /items/1
  # GET /items/1.xml
  def show
    respond_to do |wants|
      wants.html # show.html.erb
      wants.xml  { render :xml => @item }
    end
  end

  # GET /items/new
  # GET /items/new.xml
  def new
    @item = Item.create(:published => false, :page_id => params[:page_id])
    #@item.page = Page.find(params[:page_id]) if params[:page_id]
    #@item.page.ttxes.count.times do @item.item_ttxes.build end
    #3.times do
    @item.gallery_photos.build
       #5.times do

    @item.colour_photos.build(:color => "ffffff")
      
  end

  # GET /items/1/edit
  def edit
    if @item.page && @item.page.template == 'equip'
      params[:type] = 'equip'
    end
#    @item.ttx_groups.each do |tg|
      #@item.page.ttx_groups.each do |ptg|
     #   ptg.ttxes.each do |t|
     #   @item.item_ttxes.build
    #  end
     # end
#    end
#    end
    #gallery_photo = @item.gallery_photos.build
   #5.times do
    #colour_photo = @item.colour_photos.build
   # end
  end

  # POST /items
  # POST /items.xml
  def create
    @item = Item.new(params[:item])

    respond_to do |wants|
      if @item.save
        flash[:notice] = 'Item was successfully created.'
        wants.html { redirect_to(admin_items_url) }
        wants.xml  { render :xml => @item, :status => :created, :location => @item }
      else
        wants.html { render :action => "new" }
        wants.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /items/1
  # PUT /items/1.xml
  def update  
    respond_to do |wants|
      if @item.update_attributes(params[:item])
        flash[:notice] = 'Item was successfully updated.'
        wants.html { redirect_to(admin_items_path) }
        wants.xml  { head :ok }
      else
        
        wants.html { render :action => "edit" }
        wants.xml  { render :xml => @item.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.xml
  def destroy
    @item.destroy

    respond_to do |wants|
      wants.html { redirect_to(admin_items_url) }
      wants.xml  { head :ok }
    end
  end
  
  def list
    @items = Item.find(:all, :conditions => {:page_id => params[:page_id]})
    respond_to do |wants|
      wants.xml { render @items.to_xml }
      wants.js {
        render :update do |page|
          page[:items].replace_html render :partial => "list"
        end
      }
    end
  end
  
  def add_related_item_to_item
    @item = Item.find(params[:related_item_id])
    @related_item = RelatedItem.new(:item_id => params[:id], :related_item_id => params[:related_item_id])
    @related_item.save
    render :update do |page|
      page.remove('#related_item_'+params[:related_item_id])
      page.insert_html :bottom, '#related_items_list',  "<li id='li_related_item_#{@item.id}'>#{@item.title}"+ link_to_remote('Удалить', :url => '/admin/items/remove_item_relation/'+@related_item.id.to_s)+"</li>"
    end
  end
  
  def remove_item_relation
    @related_item_to_delete = RelatedItem.find(:first, :conditions => {:id => params[:id]})
    @item = Item.find_by_id(@related_item_to_delete.item_id)
    @related_item = Item.find_by_id(@related_item_to_delete.related_item_id)
    @related_item_to_delete.delete
    render :update do |page|
      page.remove('#li_related_item_'+@related_item.id.to_s)
      page.insert_html :top, 'related_item', '<option id="related_item_'+@related_item.id.to_s+'" value="'+@related_item.id.to_s+'">'+@related_item.title+'</option>'
    end
  end
  
  private
    def find_item
      @item = Item.find(params[:id])
    end

end

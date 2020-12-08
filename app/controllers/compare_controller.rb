class CompareController < ApplicationController
  def compare
    
    @item = Item.find(params[:id])
    @category = @item.page.parent.id
    
    unless session[:compare]
      session[:compare] = []
    end
    
    unless session[:compare][@category]
      session[:compare][@category] = []
    end
    
    if params[:delete] == 'delete'
      if session[:compare][@category].include? (params[:id]) && session[:compare][@category].size != 1
        session[:compare][@category].delete(params[:id])
      end
    else
      unless session[:compare][@category].include? (params[:id])
        session[:compare][@category] << params[:id]
      end
    end

    begin
    @items = Item.find(session[:compare][@category])
    rescue
#      redirect_to '/store/productio'
    end
    
  end
  
  def list_models 
    @items = Item.find(:all, :conditions => { :page_id => params[:id] })
    html = "<option disabled selected>Модель</option>"
    @items.each do |i|
      html << "<option value='#{i.id}'>#{i.title}</option>"
    end
    render :text => html
  end
end

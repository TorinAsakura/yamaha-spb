class ItemsController < ApplicationController
  layout nil
  require 'youtube_g'
  def ajax_tab
    #request.headers["Content-Type"] = "text/javascript"
    @item = Item.find(params[:id])
    #render :text => @item.to_xml
    #render :update do |js|
    
      render :partial => params[:partial]
    #end
  end

end

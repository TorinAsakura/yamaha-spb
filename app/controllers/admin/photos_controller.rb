class Admin::PhotosController < ApplicationController
  session :cookie_only => false, :only => :create
  skip_before_filter :verify_authenticity_token, :only => :create
  skip_before_filter :login_required, :only => :create
  def index
    @photos = Photo.find :all, :order => 'created_at DESC'
  end
  
  def new
    @photo = Photo.new
  end
  
  def create
  if params[:Filedata]
    @photo = Photo.new(:swfupload_file => params[:Filedata], :item_id => params[:item_id], :color => params[:color])
# if params[:color]
      #@photo.attributes(:color => "ffffff")
 # @photo.color = "ffffff"
# end
      
    if @photo.save
      render :partial => 'photo', :object => @photo
    else
      render :text => "error"
    end
  else
    @photo = Photo.new params[:photo]
    if @photo.save
      flash[:notice] = 'Your photo has been uploaded!'
      redirect_to photos_path
    else
      render :action => :new
    end
  end
  end
  
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    render :update do |page|
      page.replace_html "photo-#{params[:id]}", "Фото удалено"
    end
  end
end
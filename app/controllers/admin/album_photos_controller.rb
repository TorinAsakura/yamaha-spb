class Admin::AlbumPhotosController < ApplicationController
  session :cookie_only => false, :only => :create
  skip_before_filter :verify_authenticity_token, :only => :create
  skip_before_filter :login_required, :only => :create
  def index
    @photos = AlbumPhoto.find :all, :order => 'created_at DESC'
  end
  
  def new
    @photo = AlbumPhoto.new
  end
  
  def create
  if params[:Filedata]
    @photo = AlbumPhoto.new(:swfupload_file => params[:Filedata], :album_id => params[:album_id])
# if params[:color]
      #@photo.attributes(:color => "ffffff")
 # @photo.color = "ffffff"
# end
      
    if @photo.save
      render :partial => "admin/albums/photo", :object => @photo
    else
      render :text => "error"
    end
  else
    @photo = AlbumPhoto.new params[:photo]
    if @photo.save
      flash[:notice] = 'Your photo has been uploaded!'
      redirect_to photos_path
    else
      render :action => :new
    end
  end
  end
  
  def destroy
    @photo = AlbumPhoto.find(params[:id])
    @photo.destroy
    render :update do |page|
      page.replace_html "photo-#{params[:id]}", "Фото удалено"
    end
  end
end
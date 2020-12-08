class GalleryController < ApplicationController
  layout nil, :only => :xml
  layout "application", :only => :index
  def index
    
  end
  def xml
    
    @albums = Album.find(:all)
    render :template => "gallery/xml", :layout => nil
  end
end

require 'youtube_g'
class Admin::VideosController < AdminController
  # GET /admin_albums
  # GET /admin_albums.xml
  
  
	#youtube_unique_path = @item.youtube_video
	#youtube_base_url = "http://gdata.youtube.com/feeds/api/videos/"
	#youtube_url = "http://gdata.youtube.com/feeds/api/users/man31337d/uploads"
	#youtube_unique_id = youtube_unique_path.split(/\/|\?v\=/).last.split(/\&/).first
	#video = client.video_by youtube_base_url+youtube_unique_id rescue return "Видео не найдено"

  def index
    #@albums = Album.all
    #youtube_base_url = "http://gdata.youtube.com/feeds/api/videos/"
    YouTubeG.logger = RAILS_DEFAULT_LOGGER
    RAILS_DEFAULT_LOGGER.level = Logger::DEBUG
    
    client = YouTubeG::Client.new
    #videos = client.videos_by(:query => "penguin")
#    videos.each do |video|
 #   end
    #render :text => videos
    #respond_to do |format|
     # format.html # index.html.erb
      #format.xml  { render :xml => @admin_albums }
    #end
  end

  # GET /admin_albums/1
  # GET /admin_albums/1.xml
  def show
    @album = Album.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @album }
    end
  end

  # GET /admin_albums/new
  # GET /admin_albums/new.xml
  def new
    @album = Album.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @album }
    end
  end

  # GET /admin_albums/1/edit
  def edit
    @album = Album.find(params[:id])
  end

  # POST /admin_albums
  # POST /admin_albums.xml
  def create
    @album = Album.new(params[:album])

    respond_to do |format|
      if @album.save
        flash[:notice] = 'Album was successfully created.'
        format.html { redirect_to(["admin", @album]) }
        format.xml  { render :xml => @album, :status => :created, :location => @album }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @album.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /admin_albums/1
  # PUT /admin_albums/1.xml
  def update
    @album = Album.find(params[:id])

    respond_to do |format|
      if @album.update_attributes(params[:album])
        flash[:notice] = 'Album was successfully updated.'
        format.html { redirect_to(["admin", @album]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @album.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /admin_albums/1
  # DELETE /admin_albums/1.xml
  def destroy
    @album = Album.find(params[:id])
    @album.destroy

    respond_to do |format|
      format.html { redirect_to(admin_albums_url) }
      format.xml  { head :ok }
    end
  end
end

class Admin::BannersController < ApplicationController
  layout "admin"
  before_filter :find_banner, :only => [:show, :edit, :update, :destroy]

  # GET /banner
  # GET /banner.xml
  def index
    @banners = Banner.all

    respond_to do |wants|
      wants.html # index.html.erb
      wants.xml  { render :xml => @banner }
    end
  end

  # GET /banner/1
  # GET /banner/1.xml
  def show
    respond_to do |wants|
      wants.html # show.html.erb
      wants.xml  { render :xml => @banner }
    end
  end

  # GET /banner/new
  # GET /banner/new.xml
  def new
    @banner = Banner.new

    respond_to do |wants|
      wants.html # new.html.erb
      wants.xml  { render :xml => @banner }
    end
  end

  # GET /banner/1/edit
  def edit
    @banner = Banner.find(params[:id])
  end

  # POST /banner
  # POST /banner.xml
  def create
    @banner= Banner.new(params[:banner])

    respond_to do |wants|
      if @banner.save
        flash[:notice] = 'Баннер сохранен.'
        wants.html { redirect_to(admin_banners_url) }
        wants.xml  { render :xml => @banner, :status => :created, :location => @banner }
      else
        wants.html { render :action => "new" }
        wants.xml  { render :xml => @banner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /banner/1
  # PUT /banner/1.xml
  def update
    respond_to do |wants|
      if @banner.update_attributes(params[:banner])
        flash[:notice] = 'Страница сохранена.'
        wants.html { redirect_to(admin_banners_url) }
        wants.xml  { head :ok }
      else
        wants.html { render :action => "edit" }
        wants.xml  { render :xml => @banner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /banner/1
  # DELETE /banner/1.xml
  def destroy
    @banner.destroy

    respond_to do |wants|
      wants.html { redirect_to(admin_banners_url) }
      wants.xml  { head :ok }
    end
  end

  private
    def find_banner
      @banner = Banner.find(params[:id])
    end

end

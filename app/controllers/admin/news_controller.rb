class Admin::NewsController < ApplicationController
  layout "admin"
  before_filter :find_news, :only => [:show, :edit, :update, :destroy]

  # GET /news
  # GET /news.xml
  def index
    @news = News.all

    respond_to do |wants|
      wants.html # index.html.erb
      wants.xml  { render :xml => @news }
    end
  end

  # GET /news/1
  # GET /news/1.xml
  def show
    respond_to do |wants|
      wants.html # show.html.erb
      wants.xml  { render :xml => @news }
    end
  end

  # GET /news/new
  # GET /news/new.xml
  def new
   # @news = News.new

    respond_to do |wants|
      wants.html # new.html.erb
      wants.xml  { render :xml => @news }
    end
  end

  # GET /news/1/edit
  def edit
    @news = News.find(params[:id])
  end

  # POST /news
  # POST /news.xml
  def create
    @news = News.new(params[:news])

    respond_to do |wants|
      if @news.save
        flash[:notice] = 'Страница успешно создана.'
        wants.html { redirect_to(admin_news_url) }
        wants.xml  { render :xml => @news, :status => :created, :location => @news }
      else
        wants.html { render :action => "new" }
        wants.xml  { render :xml => @news.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /news/1
  # PUT /news/1.xml
  def update
    respond_to do |wants|
      if @news.update_attributes(params[:news])
        flash[:notice] = 'Страница сохранена.'
        wants.html { redirect_to(admin_news_url) }
        wants.xml  { head :ok }
      else
        wants.html { render :action => "edit" }
        wants.xml  { render :xml => @news.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.xml
  def destroy
    @news.destroy

    respond_to do |wants|
      wants.html { redirect_to(admin_news_url) }
      wants.xml  { head :ok }
    end
  end

  private
    def find_news
      @news = News.find(params[:id])
    end

end

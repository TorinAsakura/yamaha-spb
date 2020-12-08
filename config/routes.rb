ActionController::Routing::Routes.draw do |map|
  map.resources :albums


  map.resources :users


  #map.connect 'admin', :controller => :admin, :action => :index
  map.namespace :admin do |admin|
    admin.root :controller => :pages, :action => :new
    admin.connect 'pages/list_parent/:id', :controller => :pages, :action => :list_parent
    admin.connect 'pages/up', :controller => :pages, :action => :up
    admin.connect 'pages/down', :controller => :pages, :action => :down
    admin.connect 'pages/sort', :controller => :pages, :action => :sort
    admin.connect 'items/list/:page_id', :controller => :items, :action => :list
    admin.connect 'pages/context_menu/:id', :controller => :pages, :action => :context_menu
    admin.connect 'items/add_related_item_to_item/:id', :controller => :items, :action => :add_related_item_to_item
    admin.connect 'items/remove_item_relation/:id', :controller => :items, :action => :remove_item_relation
    admin.resources :videos
    admin.resources :pages
    admin.resources :news
    admin.resources :items, :collection => { :auto_complete_for_ttx_group_title => :any, :auto_complete_for_ttx_title => :any }
    admin.resources :ttxes
    admin.resources :ttx_groups
    admin.resources :item_ttxes
    admin.resources :album_photos
    admin.resources :posts
    admin.resources :banners
    admin.resources :photos
    admin.resources :albums
    #admin.resources :sessions
    admin.logout 'logout', :controller => 'sessions', :action => 'destroy'
    admin.login 'login', :controller => 'sessions', :action => 'new'
    admin.signin 'signin', :controller => 'sessions', :action => 'create'
  end
  #map.resources :attachment_path_with_session_information, :controller => :ckeditor
=begin
  def full_route(pages, page)
    route = []
    route << page.permalink
    while page.parent_id != 0 do
      route << page.parent.permalink
      page = page.parent
    end
    url = ""
    route = route.reverse
    route.each do |r|
      url = url + r + "/"
    end
    return url
  end
=end
#  map.connect 'ckeditor/:action', :controller => :ckeditor, :action => :action
  #map.connect 'ckeditor/:action/:id'
  map.connect '', :controller => :home
  map.connect 'about/contacts/print', :controller => :pages, :action => :print_contacts
  map.connect 'events/foto_album', :controller => :gallery, :action => :index
  map.connect 'gallery.xml', :controller => :gallery, :action => :xml
  map.connect 'equip/list_vendors', :controller => :equip, :action => :list_vendors
  map.connect 'equip/equip_types/:id', :controller => :equip, :action => :equip_types
  map.connect 'equip/vendors/:id', :controller => :equip, :action => :vendors
  map.connect 'forms/contact', :controller => :forms, :action => :contact
  map.connect 'forms/test_drive', :controller => :forms, :action => :test_drive
  map.root :controller => :home
  map.resources :news
  map.connect 'compare/list_models/:id', :controller => :compare, :action => :list_models
  map.connect 'compare/:id', :controller => :compare, :action => :compare
  map.connect 'contacts', :controller => :contacts
  map.connect 'sitemap', :controller => :sitemap
  map.connect 'items/:id/:partial', :controller => :items, :action => :ajax_tab
  map.connect 'store/*path', :controller => :store, :action => :show
  map.connect 'accessories', :controller => :equip, :action => :index
  map.connect 'accessories/*path', :controller => :equip, :action => :show
  map.connect 'store', :controller => :store, :action => :index
  map.connect '/*path', :controller => :pages, :action => :show
  map.connect ':controller', :action => :index
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

  
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)

User.create(:username => "admin", :email => "sman2d@gmail.com", :password => "admin")
Page.create(:title => 'О компании', :position => 1, :permalink => 'company', :parent_id => 0, :published => true)
Page.create(:title => 'Продукция', :position => 2, :permalink => 'production', :parent_id => 0, :published => true, :template => 'shop')
#Page.create(:title => 'Мотоциклы', :top_menu => true, :position => 1, :permalink => 'moto', :parent_id => 2, :published => true, :template => 'shop')
#Page.create(:title => 'Снегоходы', :top_menu => true, :position => 2, :permalink => 'snow', :parent_id => 2, :published => true, :template => 'shop')
#Page.create(:title => 'Б/у', :top_menu => true, :position => 3, :permalink => 'used', :parent_id => 2, :published => true, :underlined => true, :template => 'shop')
Page.create(:title => 'Мероприятия', :position => 3, :permalink => 'events', :parent_id => 0, :published => true)
Page.create(:title => 'Акссессуары', :position => 4, :permalink => 'accessories', :parent_id => 0, :published => true, :template => 'equip')
Page.create(:title => 'Сервис',  :position => 5, :permalink => 'accessories', :parent_id => 0, :published => true)
Page.create(:title => 'Запчасти',  :position => 6, :permalink => 'details', :parent_id => 0, :published => true)


Page.create(:title => 'Контакты', :left_menu => true, :permalink => 'contacts', :parent_id => 1, :position => 10, :published => false)
Page.create(:title => 'Карта сайта', :left_menu => true, :permalink => 'sitemap', :parent_id => 1, :position => 11, :published => false)
Page.create(:title => 'Новости', :left_menu => true, :permalink => 'news', :parent_id => 1, :template => 'news', :position => 1, :published => true)

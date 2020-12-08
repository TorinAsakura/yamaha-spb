class Contact < ActionMailer::Base
  
  def contact_notification(from, options)

    recipients "sman2d@gmail.com, vlad@spb-yamaha.ru, b59@spb-yamaha.ru, V.Rimsha@spb-yamaha.ru"
    from       from
    subject    "Сообщение с сайта spb-yamaha.ru"
    @options = options 
  end

end

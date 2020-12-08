class TestDrive < ActionMailer::Base
  
  def test_drive_notification(from, options)
    @options = options
    recipients "vlad@spb-yamaha.ru, b59@spb-yamaha.ru, V.Rimsha@spb-yamaha.ru"
    from       from
    subject    "Запись на тест драйв с сайта spb-yamaha.ru"
 
  end
  
end

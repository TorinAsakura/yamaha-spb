class FormsController < ApplicationController
    skip_before_filter :verify_authenticity_token
    layout nil
    def contact

      @from = params[:email]
      @name = params[:name]
      if params[:comments] # test drive
        @message = params[:comments]
        @options = params
        TestDrive.deliver_test_drive_notification(@from, @options) # sends the email
        mail = TestDrive.create_test_drive_notification(@from, @options)  # => a tmail object
        TestDrive.deliver(mail)
        
      else #contacts
        @options = params
        @message = params[:body]
        @department = params[:department]
        Contact.deliver_contact_notification(@from, @options) # sends the email
        mail = Contact.create_contact_notification(@from, @options)  # => a tmail object
        Contact.deliver(mail)
      end
      
   
      flash[:notice] = "Ваше сообщение отправлено."
    
      redirect_to :back
    end
    
    def test_drive

        render :partial => 'forms/test_drive'

    end
end

class FormsMailer < ActionMailer::Base
    # attachments
    def contact(recipient, from, body)
      recipients      recipient
      subject         "Новое письмо с сайта spb-yamaha.ru"
      from            from
      body            body
      #attachment :content_type => "image/jpeg",
       # :body => File.read("an-image.jpg")

      #attachment "application/pdf" do |a|
       # a.body = generate_your_pdf_here()
    end
end

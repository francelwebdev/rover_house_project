class NotificationsMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications_mailer.contact_us.subject
  #
  # def contact_us
  #   @greeting = "Hi"

  #   mail to: "to@example.org"
  # end

  def contact_us_message(contact_us_message)
      @contact_us_message = contact_us_message
        mail(from: @contact_us_message.email, to: "francel.webdev@gmail.com", subject: "Nouveau message dépuis le formulaire de contact de ROVER HOUSE")
  end

  def contact_owner_or_agency(message_data)
    @user = params[:user]
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end

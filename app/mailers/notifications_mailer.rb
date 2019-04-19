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
        mail(from: @contact_us_message.email, to: "francel.webdev@gmail.com", subject: "Nouveau message d'un visiteur dépuis le formulaire de contact")
  end
end

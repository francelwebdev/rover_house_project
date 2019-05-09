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

  def send_message_to_owner_or_agency(message_data)
    @destinataire_email = message_data.owner_or_agency_email
    @expediteur_email = message_data.email
    @expediteur_first_name = message_data.first_name
    @expediteur_last_name = message_data.last_name
    @message = message_data.message
    @expediteur_phone_number = message_data.phone_number
    mail(to: @destinataire_email, from: @expediteur_email, reply_to: @expediteur_email, subject: "Message d'un visiteur pour votre annonce sur ROVER HOUSE")
  end
end
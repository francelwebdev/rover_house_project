class ContactUsController < ApplicationController

  def new
    @contact_us = ContactU.new
    expires_now
  end

  def create
    @contact_us = ContactU.new(contact_us_message_params)
    if @contact_us.valid?
      NotificationsMailer.contact_us_message(@contact_us).deliver
      flash[:notice] = "Merci pour votre message. Nous vous contacterons bientôt"
      redirect_to nous_contacter_path
    else
      flash.now[:alert] = "Impossible d'envoyer le message. Veuillez vérifié si formulaire ne comporte pas d'erreurs et réssayer."
      render :new
    end
  end

  private

  def contact_us_message_params
    params.require(:contact_u).permit(:first_name, :last_name, :email, :phone_number, :message)
  end

end

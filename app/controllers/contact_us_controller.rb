class ContactUsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @contact_us = ContactU.new
    expires_in 3.months, public: false, must_revalidate: true
  end

  def create
    @contact_us = ContactU.new(params[:contact_u])
    @contact_us.request = request
    if @contact_us.deliver
      flash[:notice] = "Merci pour votre message. Nous vous contacterons bientôt"
      redirect_to contactez_nous_path
    else
      flash.now[:error] = "Impossible d'envoyer un message."
      render :new
    end
  end
end

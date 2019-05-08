class ContactOwnersOrAgenciesController < ApplicationController
    
    def create
        @contact_owner_or_agency = ContactOwnerOrAgency.new(contact_owner_or_agency_params)
        if @contact_owner_or_agency.valid?
            NotificationsMailer.contact_owner_or_agency(@contact_owner_or_agency).deliver
            flash[:notice] = "Message envoyé avec succès."
            redirect_to property_path(@property)
        else
            @property = Property.with_attached_photos.find(params[:contact_owner_or_agency][:property_id])
            flash.now[:alert] = "Impossible d'envoyer le message. Veuillez vérifier si le formulaire ne comporte pas des erreurs et réessayer."
            render "properties/show"
        end
    end

    private

    def contact_owner_or_agency_params
        params.require(:contact_owner_or_agency).permit(:property_id, :owner_or_agency_email, :first_name, :last_name, :phone_number, :email, :message)
    end
    
end

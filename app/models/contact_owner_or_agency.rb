class ContactOwnerOrAgency
    include ActiveModel::Model
    
    attr_accessor :property_id, :owner_or_agency_email, :first_name, :last_name, :email, :phone_number, :message

    validates :property_id, :owner_or_agency_email, :first_name, :last_name, :email, :phone_number, :message, presence: true

end

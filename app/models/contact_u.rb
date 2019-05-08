class ContactU
    include ActiveModel::Model
    
	attr_accessor :first_name, :last_name, :email, :phone_number, :message

	validates :first_name, :last_name, :email, :phone_number, :message, presence: true
end

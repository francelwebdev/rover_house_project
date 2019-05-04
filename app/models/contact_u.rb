class ContactU
    include ActiveModel::Model
    extend ActiveModel::Translation
    
	attr_accessor :first_name, :last_name, :email, :phone_number, :message

	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :email, presence: true
	validates :phone_number, presence: true
	validates :message, presence: true
end

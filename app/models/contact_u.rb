class ContactU < MailForm::Base
    attribute :first_name, validate: true
	attribute :last_name, validate: true
	attribute :email, validate: true
	attribute :phone_number, validate: true
	attribute :message, validate: true

	def headers
		{
			subject: "Nouveau message dépuis le formulaire de contact ROVER HOUSE.",
			to: "francel.webdev@gmail.com",
			from: %("#{first_name.capitalize} #{last_name.upcase}" <#{email}>)
		}
	end
end

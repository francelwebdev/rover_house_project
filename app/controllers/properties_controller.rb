class PropertiesController < ApplicationController
    include Pagy::Backend

	before_action :authenticate_user!, except: [:index, :show]
	before_action :set_property, only: [:edit, :destroy]
	before_action :set_property_avec_les_photos, only: [:show, :update]
	before_action :verifier_si_lutilisateur_possede_les_informations_de_contact, only: [:new]
	
	def index
		if params.has_key?(:ad_type) and !params.has_key?(:property_type) and !params.has_key?(:country) and !params.has_key?(:city) and !params.has_key?(:max_price) and !params.has_key?(:min_area)
			@pagy, @properties = pagy(Property.search(ad_type: params[:ad_type]))
		elsif params.has_key?(:ad_type) and params.has_key?(:property_type) and params.has_key?(:country) and !params.has_key?(:city) and !params.has_key?(:max_price) and !params.has_key?(:min_area)
			@pagy, @properties = pagy(Property.search(property_type: params[:property_type], ad_type: params[:ad_type], country: params[:country]))
		elsif !params.has_key?(:ad_type) and !params.has_key?(:property_type) and params.has_key?(:country) and !params.has_key?(:city) and !params.has_key?(:max_price) and !params.has_key?(:min_area)
			@pagy, @properties = pagy(Property.search(country: params[:country]))
		elsif params.has_key?(:ad_type) and params.has_key?(:property_type) and params.has_key?(:country) and params.has_key?(:city) and params.has_key?(:max_price) and params.has_key?(:min_area)
			
			p "#"*25
			if params[:max_price].blank? and params[:min_area].blank?
				@pagy, @properties = pagy(Property.search(country: params[:country], property_type: params[:property_type], ad_type: params[:ad_type], city: params[:city]))
			elsif params[:max_price].blank? and params[:min_area].present?
				@pagy, @properties = pagy(Property.search(country: params[:country], property_type: params[:property_type], ad_type: params[:ad_type], city: params[:city], area: {gteq: params[:min_area]}))
			elsif params[:max_price].present? and params[:min_area].blank?
				@pagy, @properties = pagy(Property.search(country: params[:country], property_type: params[:property_type], ad_type: params[:ad_type], city: params[:city], price: {lteq: params[:max_price]}))
			elsif params[:max_price].present? and params[:min_area].present?
				@pagy, @properties = pagy(Property.search(country: params[:country], property_type: params[:property_type], ad_type: params[:ad_type], city: params[:city], price: {lteq: params[:max_price]}, area: {gteq: params[:min_area]}))
			end
			p "#"*25
			
		else
			@pagy, @properties = pagy(Property.all)
		end
	end
	

	def show
		@contact_owner_or_agency = ContactOwnerOrAgency.new
	end
	
	def new
		@property = current_user.properties.build
	end
	
	def edit
	end
	
	def create
		@property = current_user.properties.build(property_params)
		if @property.save
			redirect_to @property, notice: 'Property was successfully created.'
		else
			render :new
		end
	end
	
	def update
		respond_to do |format|
			if @property.update(property_params)
				format.html { redirect_to @property, notice: 'Property was successfully updated.' }
			else
				format.html { render :edit }
			end
		end
	end
	
	def destroy
		@property.destroy
		respond_to do |format|
			format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
		end
	end
	
	private

	# Use callbacks to share common setup or constraints between actions.
	def set_property
		@property = Property.find(params[:id])
	end
	
	# Never trust parameters from the scary internet, only allow the white list through.
	def property_params
		params.require(:property).permit(:ad_type, :property_type, :country, :sponsored, :price, :bedroom, :bathroom, :area, :description, :city, { photos: [] })
	end

	def set_property_avec_les_photos
		@property = Property.with_attached_photos.find(params[:id])
	end

	def verifier_si_lutilisateur_possede_les_informations_de_contact
		if current_user.phone_number.blank?
			redirect_to edit_user_registration_path, alert: "SVP, veuillez compléter les informations de votre compte puis cliquer à nouveau sur déposer une annonce."
		end
	end
	
end

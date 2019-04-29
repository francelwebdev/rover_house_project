class PropertiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:search, :index, :show]
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  
  # GET /properties
  # GET /properties.json
  def index
    if params.has_key?(:ad_type) and params.has_key?(:category) and params.has_key?(:country) and params.has_key?(:city) and params.has_key?(:price)
      @pagy, @properties = pagy(Property.search(ad_type: params[:ad_type], category: params[:category], country: params[:country], city: params[:city], price: params[:price]))
    else
      @pagy, @properties = pagy(Property.all)
    end
  end
  
  # GET /properties/1
  # GET /properties/1.json
  def show
    @photos = @property.photos.all
  end
  
  # GET /properties/new
  def new
    @property = current_user.properties.build
  end
  
  # GET /properties/1/edit
  def edit
  end
  
  # POST /properties
  # POST /properties.json
  def create
    @property = current_user.properties.build(property_params)
    if @property.save
      @property.user.update_attributes!(first_name: params[:first_name], last_name: params[:last_name, phone_number: params[:phone_number]])
      redirect_to @property, notice: 'Property was successfully created.'
    else
      render :new
    end
  end
  
  # PATCH/PUT /properties/1
  # PATCH/PUT /properties/1.json
  def update
    respond_to do |format|
      if @property.update(property_params)
        format.html { redirect_to @property, notice: 'Property was successfully updated.' }
        format.json { render :show, status: :ok, location: @property }
      else
        format.html { render :edit }
        format.json { render json: @property.errors, status: :unprocessable_entity }
      end
    end
  end
  
  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    respond_to do |format|
      format.html { redirect_to properties_url, notice: 'Property was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_property
    @property = Property.find(params[:id])
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def property_params
    params.require(:property).permit(:title, :price_for_rent, :price_for_sale, :bedroom, :bathroom, :area, :description, :ad_type_id, :property_type_id, :country_id, :address, :photos, user_attributes: [:id, :first_name, :last_name, :phone_number])
  end
end

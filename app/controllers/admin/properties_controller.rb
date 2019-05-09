class Admin::PropertiesController < Admin::BaseController
  before_action :set_property, only: [:show, :edit, :update, :destroy]
  
  def index
    @properties = Property.all.order(created_at: :desc)
  end
  
  def show
  end
  
  def new
    @property = current_user.properties.build
  end
  
  def edit
  end
  
  def create
    @property = current_user.properties.build(property_params)
    if @property.save
      puts @property.user.update(phone_number: params[:property][:user_attributes][:phone_number])
      redirect_to @property, notice: 'Property was successfully created.'
    else
      render "admin/properties/new"
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
  
  # DELETE /properties/1
  # DELETE /properties/1.json
  def destroy
    @property.destroy
    redirect_to admin_root_url, notice: 'Property was successfully destroyed.'
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_property
    @property = Property.with_attached_photos.find(params[:id])
  end
  
  # Never trust parameters from the scary internet, only allow the white list through.
  def property_params
    params.require(:property).permit(:ad_type, :property_type, :country, :sponsored, :price, :bedroom, :bathroom, :area, :description, :ad_type_id, :property_type_id, :country_id, :sponsored, :city, {photos: []}, user_attributes: [:phone_number])
  end
end

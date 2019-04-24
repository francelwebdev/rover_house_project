class PropertiesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_property, only: [:show, :edit, :update, :destroy]

  def search
    @properties = Property.search(ad_type: params[:ad_type], property_type: params[:property_type], address: params[:location])
  end

  # GET /properties
  # GET /properties.json
  def index
      @pagy, @properties = pagy(Property.all)
  end

  # GET /properties/1
  # GET /properties/1.json
  def show
  end

  # GET /properties/new
  def new
    if params[:ad_type_id].present?
      @ad_type = AdType.find(params[:ad_type_id])
      session[:ad_type_id] = @ad_type.id
      session[:ad_type_name] = @ad_type.name
      @property = current_user.properties.build
    else
      flash[:notice] = "Veuillez choisir un type d'annonce."
      redirect_to ad_types_path
    end
    
  end

  # GET /properties/1/edit
  def edit
  end

  # POST /properties
  # POST /properties.json
  def create
    @property = current_user.properties.build(property_params)
    if @property.save
      redirect_to @property, notice: 'Property was successfully created.'
    else
      puts @property.errors.to_hash
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
      params.require(:property).permit(:title, :price, :area, :description, :ad_type_id, :property_type_id, :country_id, :address, photos: [])
    end
  end

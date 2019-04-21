class SearchesController < ApplicationController
    skip_before_action :authenticate_user!
  def index
    @properties = Property.search(ad_type: params[:ad_type], property_type: params[:property_type], address: params[:location])
  end
end

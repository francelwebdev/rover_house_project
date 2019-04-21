class SearchesController < ApplicationController
    skip_before_action :authenticate_user!
  def index
    puts "^" * 50
    @properties = Property.search(ad_type: params[:ad_type], property_type: params[:property_type], address: params[:location])
    puts "^" * 50
  end
end

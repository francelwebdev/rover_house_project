class PagesController < ApplicationController
    skip_before_action :authenticate_user!

  def home
    @properties = Property.includes(:property_type, :country).order(created_at: :desc).limit(10).with_attached_photos
  end

  def about_us
      
  end

  def faq
      
  end
end

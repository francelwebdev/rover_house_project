class PagesController < ApplicationController

  def home
    @properties = Property.order(created_at: :desc).limit(10).with_attached_photos
  end

  def about_us
      
  end

  def faq
      
  end
  
end

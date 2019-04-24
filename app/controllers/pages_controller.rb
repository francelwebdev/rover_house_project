class PagesController < ApplicationController
    skip_before_action :authenticate_user!

  def home
    @properties = Property.order(created_at: :desc).limit(6).includes(:country)
  end

  def about_us
      
  end

  def faq
      
  end
end

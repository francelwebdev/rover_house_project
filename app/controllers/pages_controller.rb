class PagesController < ApplicationController

  def home
    @properties = Property.where(published: true).order(created_at: :desc).limit(10)
  end

  def about_us
      
  end

  def faq
      
  end
  
end

class MyPropertiesController < ApplicationController
    include Pagy::Backend

    before_action :authenticate_user!

  def index
    @pagy, @my_properties = pagy(current_user.properties.with_attached_photos)
  end

end

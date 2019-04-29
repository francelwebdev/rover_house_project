class MyPropertiesController < ApplicationController
  def index
    @my_properties = current_user.properties
  end
end

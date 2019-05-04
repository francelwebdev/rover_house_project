class Admin::BaseController < ActionController::Base
    layout "admin"

    before_action :authenticate_admin!


    private

    def authenticate_admin!

    end
end

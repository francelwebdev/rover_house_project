class Admin::BaseController < ActionController::Base
    layout "admin"
    
    before_action :authenticate_admin!
    
    private
    
    def authenticate_admin!
        authenticate_user!
        redirect_to :root_path, status: :forbidden if current_user.role != "Admin"
    end
    
end

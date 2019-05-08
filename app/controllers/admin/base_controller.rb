class Admin::BaseController < ActionController::Base
    layout "admin"

    before_action :authenticate_user!
    before_action :require_admin

    def require_admin
        if !current_user.is_admin? and current_user.role != "Admin"
            flash[:alert] = "Vous n'avez pas de droit d'accéder à cette page."
            redirect_to root_path
        end
    end
    
end

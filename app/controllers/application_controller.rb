class ApplicationController < ActionController::Base
    layout :layout_to_use

    include Pagy::Backend
    
    protect_from_forgery
    
    before_action :authenticate_user!
    before_action :set_locale
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    def default_url_options
        { locale: I18n.locale }
    end
    
    def set_locale
        I18n.locale = params[:locale] || I18n.default_locale
    end
    
    protected
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
        # devise_parameter_sanitizer.permit(:account_update, keys: [])
    end

    private

    def layout_to_use
        if user_signed_in? 
            if current_user.is_admin?
            "admin"
            else
                "application"
            end
        end
  end

end

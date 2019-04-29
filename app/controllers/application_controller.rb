class ApplicationController < ActionController::Base
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
        devise_parameter_sanitizer.permit(:account_update, keys: [])
    end
    
end

class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    before_action :set_locale
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :all_ad_types
    
    protect_from_forgery prepend: true
    
    include Pagy::Backend
    
    def default_url_options
        { locale: I18n.locale }
    end
    
    def set_locale
        I18n.locale = params[:locale] || I18n.default_locale
    end

    def all_ad_types
        @ad_types = AdType.all
    end
    
    protected
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:role, :name])
    end
    
end

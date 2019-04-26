class ApplicationController < ActionController::Base
    include Pagy::Backend
    
    protect_from_forgery
    
    before_action :authenticate_user!
    before_action :set_locale
    before_action :all_ad_types, :all_property_types
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    def default_url_options
        { locale: I18n.locale }
    end
    
    def set_locale
        I18n.locale = params[:locale] || I18n.default_locale
    end
    
    def all_ad_types
        @ad_types = AdType.all
    end
    def all_property_types
        @property_types = PropertyType.all
    end
    
    protected
    
    def configure_permitted_parameters
        # devise_parameter_sanitizer.permit(:sign_up, keys: [{roles: []}])
        devise_parameter_sanitizer.permit(:account_update, keys: [])
    end
    
end

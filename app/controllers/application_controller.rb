class ApplicationController < ActionController::Base
    # protect_from_forgery

    etag { current_user.try :id }

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
        devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :phone_number])
    end

end

# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def configure_permitted_parameters
   devise_parameter_sanitizer.permit(:sign_up) do |u|
     u.permit(:first_name, :last_name, :email, :password)
   end
  end

  def default_url_options
    { locale: I18n.locale }
  end

  def after_sign_in_path_for(resource)
    resource.admin? ? admin_root_path : root_path
  end

  def access_denied(exception)
    redirect_to root_path , alert: exception.message
  end
end

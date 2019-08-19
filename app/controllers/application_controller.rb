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
end

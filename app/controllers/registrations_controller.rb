class RegistrationsController < Devise::RegistrationsController
  include UserService

  after_action :add_avatar

  protected

  def add_avatar
    add_default_avatar(resource) if resource.persisted?
  end
end

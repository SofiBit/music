# frozen_string_literal

module UserService
  def add_default_avatar(user)
    path = Rails.root + "app/images/default-user-avatar.jpg"
    File.open(path) { |f| user.avatar = f }
    user.save
  end
end
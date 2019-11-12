# frozen_string_literal: true

module UserService
  def add_default_avatar(user)
    path = Rails.root + "app/images/default-user-avatar.jpg"
    File.open(path) { |f| user.update(avatar: f) }
  end

  def user_name(user)
    return user.nickname if user.nickname.present?

    "#{user.first_name} #{user.last_name}"
  end
end

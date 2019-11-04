# frozen_string_literal

module RoomsHelper
  def name_room(room, current_user)
    user = room.users.reject { |user| user == current_user }.first
    user_name(user)
  end
end

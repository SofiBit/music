class RoomMessage < ApplicationRecord
  include UserService

  belongs_to :user
  belongs_to :room, inverse_of: :room_messages

  def as_json(options)
    super(options).merge(user_name: user_name(user), avatar: user.avatar)
  end
end

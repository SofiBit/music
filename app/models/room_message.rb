class RoomMessage < ApplicationRecord
  after_create_commit { ChatroomJob.perform_later(room, self) }

  belongs_to :user
  belongs_to :room, inverse_of: :room_messages

  def as_json(options)
    super(options).merge(user_name: user.first_name)
  end
end

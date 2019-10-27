class ChatroomJob < ApplicationJob
  queue_as :default

  def perform(room, message)
    RoomChannel.broadcast_to(room, message)
  end
end

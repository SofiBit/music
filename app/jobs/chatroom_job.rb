class ChatroomJob < ApplicationJob
  queue_as :default

  def perform(room, message)
    RoomChannel.broadcast_to(room, message)
  end

  # def perform(message)
  #   ActionCable.server.broadcast "chat_room_#{message.chat_room.id}_channel",
  #                                message: render_message(message)
  # end
  #
  # private
  #
  # def render_message(message)
  #   MessagesController.render partial: 'messages/message', locals: {message: message}
  # end
end

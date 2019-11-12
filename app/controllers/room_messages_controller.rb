class RoomMessagesController < ApplicationController
  before_action :find_room

  def create
    message = ChangeMessage.run(message: params.dig(:room_message, :message))
    @room_message = RoomMessage.create user: current_user,
                                       room: @room,
                                       message: message
   ChatroomJob.perform_later(@room, @room_message)
  end

  protected

  def find_room
    @room = Room.find(params.dig(:room_message, :room_id))
  end
end

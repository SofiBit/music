class RoomsController < ApplicationController
  load_and_authorize_resource only: %i[show]

  before_action :find_room, only: %i[edit update show]
  before_action :all_rooms, only: %i[index show]
  before_action :authenticate_user!

  def index
  end

  def show
    @room_message = RoomMessage.new room: @room
    @room_messages = @room.room_messages.includes(:user)
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      @room.users << User.find(params[:user])
      @room.users << current_user
      redirect_to room_path(@room)
    else
      render :new
    end
  end

  protected

  def find_room
    @room = Room.find(params[:id])
  end

  def all_rooms
    @rooms = current_user.rooms
  end

  def room_params
    params.require(:room).permit(:name)
  end
end

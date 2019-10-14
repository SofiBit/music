class RoomsController < ApplicationController
  before_action :find_room, only: %i[edit update show]
  before_action :all_rooms, only: %i[index show]

  def index
  end

  def show
    @room_message = RoomMessage.new room: @room
    @room_messages = @room.room_messages.includes(:user)
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)

    if @room.save
      flash[:success] = "Room #{@room.name} was created successfully"
      @room.users << User.find(params[:user])
      @room.users << current_user
      redirect_to rooms_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @room.update_attributes(room_params)
      flash[:success] = "Room #{@room.name} was updated successfully"
      redirect_to rooms_path
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

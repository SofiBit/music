class PlaylistsController < ApplicationController
  include PlaylistImage

  load_and_authorize_resource only: %i[show new create destroy update]

  before_action :find_playlist, only: %i[show destroy edit update]
  before_action :authenticate_user!

  def index
    user = User.find(params[:user_id])
    @playlists = user.playlists.all
  end

  def show; end

  def new
    @playlist = Playlist.new
    respond_to { |format| format.js }
  end

  def create
    @playlist = current_user.playlists.new(playlist_params)
    check_playlist_image(@playlist)
    if @playlist.save
      respond_to do |format|
        format.js
        format.json  { render 'create' }
      end
    else
      respond_to do |format|
        format.js { render :new }
        format.json { render json: { message: @playlist.errors.messages } }
      end
    end
  end

  def destroy
    @playlist.destroy
    redirect_to user_playlists_path(current_user)
  end

  def edit; end

  def update
    @playlist.update(playlist_params)

    if @playlist.save
      respond_to do |format|
        format.json { render json: {status: 'success'} }
      end
    else
      respond_to do |format|
        format.json { render json: {status: 'not success'} }
      end
    end
  end

  private

  def find_playlist
    @playlist = Playlist.find(params[:id])
  end

  def playlist_params
    params.require(:playlist).permit(:title, :private, :image)
  end
end

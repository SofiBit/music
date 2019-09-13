class PlaylistsController < ApplicationController
  before_action :find_playlist, only: %i[show destroy edit update]

  def index
    user = User.find(params[:user_id])
    @playlists = user.playlists.all
  end

  def show; end

  def new
    @playlist = Playlist.new
  end

  def create
    @playlist = current_user.playlists.new(playlist_params)

    if @playlist.save
      redirect_to user_playlists_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @playlist.destroy
    redirect_to user_playlists_path(current_user)
  end

  def edit; end

  def update
    if @playlist.update(playlist_params)
      redirect_to user_playlists_path(@playlist.user)
    else
      render :edit
    end
  end

  private

  def find_playlist
    @playlist = Playlist.find(params[:id])
  end

  def playlist_params
    params.require(:playlist).permit(:title)
  end
end

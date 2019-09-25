class TracksController < ApplicationController
  def index
    @tracks = current_user.tracks
  end

  def destroy
    track = Track.find(params[:id])
    track.destroy
    redirect_to tracks_path
  end

  def show
    @track = Track.find(params[:id])
  end

  def update
    @track = Track.find(params[:id])
    if track_params[:playlist].empty?
      redirect_to track_path(@track)
    else
      @playlist = Playlist.find(track_params[:playlist])
      @track.playlists << @playlist
      redirect_to track_path(@track)
    end
  end

  private

  def track_params
    params.require(:track).permit(:playlist)
  end
end

class TracksController < ApplicationController
  before_action :find_track, only: %i[show update]
  def index
    @tracks = current_user.tracks
  end

  def destroy
    track = Track.find(params[:id])
    track.destroy
    redirect_to tracks_path
  end

  def show
    @playlist = Playlist.find(params[:playlist_id]) if params[:playlist_id]
  end

  private

  def track_params
    params.require(:track).permit(:private)
  end

  def find_track
    @track = Track.find(params[:id])
  end
end

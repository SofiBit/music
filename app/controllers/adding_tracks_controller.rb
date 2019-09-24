class AddingTracksController < ApplicationController
  def create
    @track = Track.find(params[:track])
    playlist = Playlist.find(params[:playlist])
    if @track.playlists.include?(playlist)
      respond_to do |format|
        message = { status: "not ok", message: "Track already added to playlist" }
        format.json  { render json: message }
      end
    else
      @track.playlists << playlist
      respond_to do |format|
        message = { status: "ok", message: "Track successfully added to playlist" }
        format.json  { render json: message }
      end
    end
  end

  def destroy
    @adding_track = AddingTrack.find(params[:id])
    @adding_track.destroy
    redirect_to user_playlist_path(current_user, @adding_track.playlist)
  end
end

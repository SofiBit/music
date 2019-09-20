class AddingTracksController < ApplicationController
  def create
    @track = Track.find(params[:track])
    @track.playlists << Playlist.find(params[:playlist].to_i)
    redirect_to tracks_path(current_user)
  end

  def destroy
    @adding_track = AddingTrack.find(params[:id])
    @adding_track.destroy
    redirect_to user_playlist_path(current_user, @adding_track.playlist)
  end
end

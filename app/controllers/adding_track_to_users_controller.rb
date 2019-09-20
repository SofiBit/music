class AddingTrackToUsersController < ApplicationController
  def create
    track = Track.find(params[:track])
    if current_user.tracks.include?(track)
      flash[:notice] = 'Track already added'
      redirect_to root_path
    else
      current_user.tracks << track
      redirect_to controller: 'adding_tracks', action: 'new', track: track
    end
  end

  def destroy
    track = AddingTrackToUser.find(params[:id])
    track.delete
    redirect_to tracks_path(current_user)
  end
end

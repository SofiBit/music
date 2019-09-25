class AddingTrackToUsersController < ApplicationController
  def create
    track = Track.find(params[:track])
    if current_user.tracks.include?(track)
      respond_to do |format|
        message = { status: "not ok", message: "Track already added" }
        format.json  { render json: message }
      end
    else
      current_user.tracks << track
      respond_to do |format|
        message = { status: "ok", message: "Track successfully added" }
        format.json  { render json: message }
      end
    end
  end

  def destroy
    track = AddingTrackToUser.find(params[:id])
    track.delete
    redirect_to tracks_path(current_user)
  end
end

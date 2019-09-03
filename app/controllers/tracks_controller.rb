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
end

class PlaylistSubscriptionsController < ApplicationController
  def create
    @playlist = Playlist.find(params[:playlist])
    current_user.playlist_subscriptions.create(playlist_id: params[:playlist])
    respond_to { |format| format.js }
  end

  def destroy
    @playlist = Playlist.find(params[:id])
    current_user.playlist_subscriptions.find_by(playlist_id: params[:id]).destroy
  end
end

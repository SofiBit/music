class PlaylistSubscriptionsController < ApplicationController
  before_action :find_user, only: %i[create_all destroy_all]

  def create_all
    @user.playlists.each do |playlist|
      current_user.playlist_subscriptions.create(playlist: playlist)
    end
    respond_to { |format| format.js }
  end

  def destroy_all
    @user.playlists.each do |playlist|
      current_user.playlist_subscriptions.find_by(playlist: playlist).destroy
    end
    respond_to { |format| format.js }
  end

  def create
    @playlist = Playlist.find(params[:playlist])
    current_user.playlist_subscriptions.create(playlist_id: params[:playlist])
    respond_to { |format| format.js }
  end

  def destroy
    @playlist = Playlist.find(params[:id])
    current_user.playlist_subscriptions.find_by(playlist_id: params[:id]).destroy
  end

  private

  def find_user
    @user = User.find(params[:user])
  end
end

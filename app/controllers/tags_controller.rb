class TagsController < ApplicationController
  def new
    @playlist = Playlist.find(params[:playlist_id])
    respond_to { |format| format.js }
  end

  def create
    tags = params[:tags].split(' ')
    playlist = Playlist.find(params[:playlist])
    tags.each { |tag| playlist.tags.create(name: tag) }

    redirect_to user_playlist_path(current_user, playlist)
  end
end

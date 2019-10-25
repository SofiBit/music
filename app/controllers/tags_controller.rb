class TagsController < ApplicationController
  def create
    tags = params[:tags].split(' ')
    playlist = Playlist.find(params[:playlist])
    tags.each do |tag|
      playlist.tags.create(name: tag)
    end
    redirect_to user_playlist_path(current_user, playlist)
  end
end

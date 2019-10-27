# frozen_string_literal: true

module PlaylistImage
  def check_playlist_image(playlist)
    add_default_image(playlist) unless playlist.image?
  end

  def add_default_image(playlist)
    path = Rails.root + "app/images/default_playlist_image.jpg"
    File.open(path) { |f| playlist.image = f }
    playlist.save
  end
end

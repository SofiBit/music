# frozen_string_literal: true

require "open-uri"

module SaveTrack
  def save_track(result)
    return Track.find_track(result) if Track.already_exist?(result)
    track = Track.create( artist: result[:info][:artist],
                          name: result[:info][:name],
                          album: result[:info][:album],
                          release_date: result[:info][:release_date],
                          provider_links: result[:links].to_json )
    add_img(track)
  end

  def add_img(track)
    path = Rails.root + "app/images/image.png"
    File.open(path) { |f| track.track_image = f }
    track.save!
    track
  end
end

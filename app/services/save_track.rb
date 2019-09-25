# frozen_string_literal: true
require "open-uri"

module SaveTrack

  def save_track(result)
    return if Track.already_exist?(result)
    track = Track.create( artist: result[:info][:artist],
                          name: result[:info][:name],
                          album: result[:info][:album],
                          release_date: result[:info][:release_date],
                          provider_links: result[:links].to_json )
    path = Rails.root + "app/images/image.png"
    File.open(path) { |f| track.track_image = f }
    track.save!
  end
end

# frozen_string_literal: true

require "open-uri"

module SaveTrack
  def save_track(result, link)
    track = Track.create( link: link,
                          artist: result[:info][:artist],
                          name: result[:info][:name],
                          album: result[:info][:album],
                          release_date: result[:info][:release_date],
                          provider_links: result[:links].to_json,
                          track_image: result[:info][:image]['url']
                        )
  end
end

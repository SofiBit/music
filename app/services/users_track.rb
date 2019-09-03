# frozen_string_literal: true

module UsersTrack
  def track_to_user(link, result, current_user)
    if current_user
      current_user.tracks.create( link: link,
                                  artist: result['info']['artist'],
                                  name: result['info']['name'],
                                  album: result['info']['album'],
                                  release_date: result['info']['release_date'],
                                  provider_links: result['links'].to_json )
    end
  end
end

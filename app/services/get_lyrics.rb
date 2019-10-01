# frozen_string_literal: true

class GetLyrics
  URL = 'https://api.musixmatch.com/ws/1.1/matcher.lyrics.get?'

  class << self
    def run(artist:, track:)
      new(artist: artist, track: track).run
    end
  end

  def initialize(artist:, track:)
    @artist = artist
    @track = track
  end

  def run
    response = Faraday.get(URL, apikey: ENV['MUSUXMATCH_API_KEY'],
                                q_track: @track,
                                q_artist: @artist)

    body = JSON.parse(response.body)
    body['message']['body']['lyrics']['lyrics_body']
  end
end

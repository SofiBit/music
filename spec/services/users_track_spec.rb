require 'spec_helper'
require 'rails_helper'

require_relative "../../app/services/users_track"

describe UsersTrack do
  include UsersTrack

  it "should add track to user" do
    current_user = User.last
    link = 'link'
    result = {"links"=>
      {"spotify"=>"https://open.spotify.com/track/26ID4xrP0e9OmBYYmzMkjM",
        "apple_music"=>
        "https://music.apple.com/us/album/serene/594430387?i=594430443&uo=4"},
        "info"=>
        {"artist"=>"Hearts of Black Science",
          "name"=>"Serene",
          "album"=>"The Ghost You Left Behind",
          "url"=>"https://open.spotify.com/track/26ID4xrP0e9OmBYYmzMkjM",
          "release_date"=>"2007-04-03"}}
    track_to_user(link, result, current_user)
    expect( current_user.tracks.last.artist ).to eq(result['info']['artist'])
  end
end

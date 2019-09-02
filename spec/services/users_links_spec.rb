require 'spec_helper'
require 'rails_helper'

require_relative "../../app/services/users_links"

describe UsersLinks do
  include UsersLinks

  it "should add link to user" do
    current_user = User.last
    result_info = {
      "artist"=>"Hearts of Black Science",
      "name"=>"Serene",
      "album"=>"The Ghost You Left Behind",
      "url"=>"https://open.spotify.com/track/26ID4xrP0e9OmBYYmzMkjM",
      "release_date"=>"2007-04-03"
      }
    links_to_user(result_info, current_user)
    expect( current_user.source_links.last.artist ).to eq(result_info['artist'])
  end
end

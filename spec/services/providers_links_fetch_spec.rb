require 'spec_helper'
require 'rails_helper'

require_relative "../../app/services/providers_links_fetch"

describe ProvidersLinksFetch do
  include ProvidersLinksFetch
  context "if can be parsed" do
    source_link = 'https://open.spotify.com/track/26ID4xrP0e9OmBYYmzMkjM?si=\
        FuY7U_IDRTmxmHdIT6NBMQ'
    result = {"links"=>
      {"spotify"=>"https://open.spotify.com/track/26ID4xrP0e9OmBYYmzMkjM",
      "apple_music"=>
      "https://music.apple.com/us/album/serene/594430387?i=594430443&uo=4"},
      "info"=>
      {"artist"=>"Hearts of Black Science",
      "name"=>"Serene",
      "album"=>"The Ghost You Left Behind",
      "url"=>"https://open.spotify.com/track/26ID4xrP0e9OmBYYmzMkjM",
      "release_date"=>"2007-04-03",
      "image"=>
      {"height"=>640,
      "url"=>"https://i.scdn.co/image/cf801344faa36f56d7c2923a86673630176689e6",
      "width"=>640}}}

    it "should return links and info" do
      expect(run(source_link)).to eq(result)
    end
  end

  context "if can't be parsed" do
    no_valid = 'No valid link'
    it "should throw an exception" do
      begin
        run(no_valid)
      rescue RuntimeError => exception
        expect(exception.message).to eq('Cant be parsed')
      end
    end
  end
end

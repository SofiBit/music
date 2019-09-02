require 'spec_helper'
require 'rails_helper'

require_relative "../../app/services/users_links"

describe UsersLinks do
  include UsersLinks

  it "should add link to user" do
    current_user = User.last
    link = 'http/test'
    links_to_user(link, current_user)
    expect( current_user.source_links.last.link ).to eq(link)
  end
end

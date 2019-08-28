require 'spec_helper'
require 'rails_helper'

describe LinksController do
  render_views
  login_user

  context "GET #index" do
    it "should get index" do
      get 'index'
      response.should be_success
    end

    it "should have input" do
      visit root_path
      expect(page).to have_selector('form')
    end

    it "should return links" do
      visit root_path
      link = "https://open.spotify.com/track/26ID4xrP0e9OmBYYmzMkjM?si=FuY7U_IDRTmxmHdIT6NBMQ"
      fill_in :source_link, with: link
      click_button 'Send'
      expect(page).to have_content('')
    end
  end
end

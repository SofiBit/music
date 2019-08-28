require 'spec_helper'
require 'rails_helper'

describe SourceLinksController do
  login_user 
  render_views

  before { subject.current_user.source_links.create(link: "link") }

  context "GET #index" do
    it "should get index" do
      get 'index'
      response.should be_success
    end

    it "should show links" do
      links = subject.current_user.source_links
      visit source_links_path
      links.each do |source_link|
        expect(page).to have_link(source_link.link)
      end
    end
  end

  context "DELETE #destroy" do
    it "should delete a link" do
      visit source_links_path

      page.should have_link('Delete link')
      expect { click_link 'Delete link' }.to change(SourceLink, :count).by(-1)
    end
  end
end

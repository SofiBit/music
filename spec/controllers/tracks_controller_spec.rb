require 'spec_helper'
require 'rails_helper'

describe TracksController do
  login_user

  context "GET #index" do
    it "should get index" do
      get 'index'
      response.should be_success
    end

    it "renders the index template" do
      get 'index'
      expect(response).to render_template("index")
    end
  end

  context "DELETE #destroy" do
    it "should delete a link" do
      track = Track.last

      expect{
        delete 'destroy', params: { id: track.id }
     }.to change(Track, :count).by(-1)
    end

    it "should redirect to source links" do
      track = Track.last
      delete 'destroy', params: { id: track.id }

      response.should redirect_to tracks_path
    end
  end
end

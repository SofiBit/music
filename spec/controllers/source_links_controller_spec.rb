require 'spec_helper'
require 'rails_helper'

describe SourceLinksController do
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
      link = SourceLink.last

      expect{
        delete 'destroy', params: { id: link.id }
     }.to change(SourceLink, :count).by(-1)
    end

    it "should redirect to source links" do
      link = SourceLink.last
      delete 'destroy', params: { id: link.id }

      response.should redirect_to source_links_path
    end
  end
end

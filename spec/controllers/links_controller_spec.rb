require 'spec_helper'
require 'rails_helper'

describe LinksController do
  login_user

  context "GET #index" do
    it "should get index" do
      get :index
      response.should be_success
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end

  context "GET #show" do
    it "should get show" do
      controller.stub(:generate_links).and_return(true)
      controller.stub(:links_to_user).and_return(true)
      get :show, format: :json
      response.should be_success
    end
  end
end

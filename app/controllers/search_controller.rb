class SearchController < ApplicationController
  def index
    @users = User.search_users(params[:query])
    respond_to do |format|
      format.js
      format.json { render json: @users.to_json }
    end
  end
end

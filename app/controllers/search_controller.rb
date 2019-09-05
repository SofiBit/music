class SearchController < ApplicationController
  def index
    name = params[:user_name]
    @users = User.where(first_name: name)
    respond_to do |format|
      format.js
      format.json { render json: @users.to_json }
    end
  end
end

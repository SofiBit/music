# frozen_string_literal: true

class LinksController < ApplicationController
  include ProvidersLinksFetch
  include UsersLinks

  def index; end

  def show
    link = params[:source_link]
    @result = run(link)
    verification
    links_to_user(link)
    respond_to do |format|
      format.js
      format.json { render json: @result.to_json }
    end
  end

  def verification
    if @result == 'error'
      flash[:notice] = 'Not found'
      redirect_to root_path
    end
  end
end

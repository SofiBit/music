# frozen_string_literal: true

class LinksController < ApplicationController
  include ProvidersLinksFetch
  include UsersLinks
  include ServiceObjects

  def index; end

  def show
    link = params[:source_link]
    generate_links_info(link)
    links_to_user(@result['info'], current_user)
    respond_to do |format|
      format.js
      format.json { render json: @result.to_json }
    end
  end
end

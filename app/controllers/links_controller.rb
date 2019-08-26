# frozen_string_literal: true

class LinksController < ApplicationController
  include ProvidersLinksFetch
  include UsersLinks

  def index; end

  def show
    link = params[:source_link]
    result_error(link)
    links_to_user(link)
    respond_to do |format|
      format.js
      format.json { render json: @result.to_json }
    end
  end

  private

  def result_error(link)
    @result = run(link)
  rescue RuntimeError => e
    flash[:error] = 'Not found'
    respond_to do |format|
      format.js { render js: "window.location='#{root_path.to_s}'" }
    end
  end
end

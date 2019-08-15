# frozen_string_literal: true

class LinksController < ApplicationController
  include ProvidersLinksFetch
  include UsersLinks

  def index; end

  def show
    link = params[:source_link]
    @result = run(link)
    binding.pry
    links_to_user(link) unless @result == 'error'
    respond_to do |format|
      format.js
      format.json { render json: @result.to_json }
    end
  end
end

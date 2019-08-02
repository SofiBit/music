# frozen_string_literal: true

require_relative '../services/providers_links_fetch.rb'

class LinksController < ApplicationController
  include ProvidersLinksFetch

  def index; end

  def show
    link = params[:source_link]
    @result = run(link)
    render layout: false
  end
end

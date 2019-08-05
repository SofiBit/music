# frozen_string_literal: true

require_relative '../services/providers_links_fetch.rb'

class LinksController < ApplicationController
  include ProvidersLinksFetch

  before_action :authenticate_user!

  def index; end

  def show
    link = params[:source_link]
    @result = run(link)
    render layout: false
    current_user.source_links.create(link: params[:source_link])
  end
end

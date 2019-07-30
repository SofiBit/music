require_relative '../services/source.rb'

class LinksController < ApplicationController
  before_action :find_link, only: %i[link_source]

  def index; end

  def show; end

  def link_source
    @result = Source.run(@link)
    render :index
  end

  private

  def find_link
    @link = params[:source_link]
  end
end

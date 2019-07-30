require_relative '../services/data_from_heroku.rb'

class LinksController < ApplicationController
  include DataFromHeroku

  def index; end

  def show
    link = params[:source_link]
    @result = run(link)
  end
end

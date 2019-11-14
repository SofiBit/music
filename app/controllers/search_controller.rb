#frozen_string_literal

class SearchController < ApplicationController
  include Search

  def index
    @results = results
    if @results.empty?
      flash[:error] = t('app.not_found')
      redirect_back fallback_location: root_path
    else
      render :index
    end
  end
end

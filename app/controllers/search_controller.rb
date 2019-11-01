#frozen_string_literal

class SearchController < ApplicationController
  include Search
  
  def index
    @results = results
    respond_to do |format|
      format.html { render 'index' }
      format.js
    end
  end
end

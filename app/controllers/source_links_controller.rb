class SourceLinksController < ApplicationController
  def index
    @links = current_user.source_links
  end

  def destroy
    link = SourceLink.find(params[:id])
    link.destroy
    redirect_to source_links_path
  end
end

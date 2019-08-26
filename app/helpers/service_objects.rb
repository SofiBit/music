module ServiceObjects
  def generate_links(link)
    @result = run(link)
  rescue RuntimeError
    flash[:error] = 'Not found'
    respond_to do |format|
      format.js { render js: "window.location='#{root_path.to_s}'" }
    end
  end
end

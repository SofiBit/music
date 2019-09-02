module ServiceObjects
  def generate_links_info(link)
    @result = run(link)
  rescue RuntimeError => e
    flash[:error] = t('my_notice.not_found')
    respond_to do |format|
      format.js { render js: "window.location='#{root_path.to_s}'" }
    end
  end
end

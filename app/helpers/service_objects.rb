module ServiceObjects
  def generate_links_info(link)
    @result = run(link)
  rescue RuntimeError
    flash[:error] = t('my_notice.not_found')
    respond_to do |format|
      format.js { render js: "window.location='#{root_path.to_s}'" }
    end
  end

  def generate_success?(link)
    return true if run(link)
  rescue RuntimeError
    false
  end
end

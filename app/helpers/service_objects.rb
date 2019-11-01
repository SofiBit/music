require "open-uri"

module ServiceObjects
  def generate_links_info(link)
    @result = run(link)
    file_open
    flash.now[:notice] = "#{t('app.registration_offer')} - #{view_context.link_to(t('links.sign_up'), new_user_registration_path)}" unless current_user
  rescue RuntimeError => e
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

  def file_open
    File.open("app/images/image.png", 'wb') do |fo|
      fo.write open(@result[:info][:image]['url']).read
    end
  end
end

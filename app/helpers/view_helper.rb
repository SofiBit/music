module ViewHelper

  def share_telegram(result)
    image_tag(ENV['URI_IMG_TELEGRAM'],
     onclick: "shareTelegram('#{ENV['URI_APP']}', '#{transform_links(result)}')",
     style: "cursor: pointer")
  end

  def share_email(result)
    image_tag(ENV['URI_IMG_GMAIL'],
     onclick: "shareEmail('#{ENV['URI_APP']}', '#{transform_links(result)}')",
     style: "cursor: pointer")
  end

  def transform_links(result)
    array = []
    result.each do |provider, song|
      array << "#{provider.capitalize.gsub(/[_]/, ' ')}:%20#{song}"
    end
    array.join("%0A")
  end

  def bootstrap_class(name)
    { success: 'alert-success',
      error: 'alert-danger',
      danger: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info' }[name.to_sym] || name
  end

  def count_adding_track(result)
    AddingTrackToUser.count_adding(Track.find_track(result))
  end
end

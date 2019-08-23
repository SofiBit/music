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
    result.each do |k, v|
      array << "#{k.capitalize.gsub(/[_]/, ' ')}:%20#{v}"
    end
    array.join("%0A")
  end
end

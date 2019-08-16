module ViewHelper
  URI_IMG_TELEGRAM = "https://img.icons8.com/color/48/000000/telegram-app.png"
  URI_IMG_GMAIL = "https://img.icons8.com/color/48/000000/gmail.png"

  def share_telegram(result)
    image_tag(URI_IMG_TELEGRAM,
     onclick: "shareTelegram('#{ENV['URI_APP']}', '#{transform(result)}')",
     style: "cursor: pointer")
  end

  def share_email(result)
    image_tag(URI_IMG_GMAIL,
     onclick: "shareEmail('#{ENV['URI_APP']}', '#{transform(result)}')",
     style: "cursor: pointer")
  end

  def transform(result)
    array = []
    result.each do |k, v|
      array << "#{k.capitalize.gsub(/[_]/, ' ')}:%20#{v}"
    end
    array.join("%0A")
  end
end

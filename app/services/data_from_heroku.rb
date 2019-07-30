module DataFromHeroku
  URL = 'https://euterpe-app.herokuapp.com/links'

  def run(link)
    resp = Faraday.get(URL, {source_link: link})
    body = resp.body
    JSON.parse(body)
  end
end

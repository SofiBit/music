require 'faraday'
require "json"

class Source
  def self.run(link)
    url = 'https://euterpe-app.herokuapp.com/links'
    resp = Faraday.get(url, {source_link: link})
    body = resp.body
    JSON.parse(body)
  end
end

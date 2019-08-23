# frozen_string_literal: true

module ProvidersLinksFetch
  URL = 'https://euterpe-app.herokuapp.com/links'

  def run(link)
    resp = Faraday.get(URL, source_link: link)
    body = resp.body
    JSON.parse(body)
  rescue JSON::ParserError
    raise "Cant parse it"
  end
end

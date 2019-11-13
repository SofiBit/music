# frozen_string_literal: true

module ProvidersLinksFetch
  def run(link)
    response = Euterpe::Aggregator.run(source_link: link)
  rescue
    raise 'Not found'
  end
end

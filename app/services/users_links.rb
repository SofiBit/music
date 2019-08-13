# frozen_string_literal: true

module UsersLinks
  def links_to_user(link)
    current_user.source_links.create(link: link) if current_user
  end
end

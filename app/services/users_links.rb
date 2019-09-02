# frozen_string_literal: true

module UsersLinks
  def links_to_user(result, current_user)
    if current_user
      current_user.source_links.create( link: result['url'],
                                        artist: result['artist'],
                                        name: result['name'],
                                        album: result['album'],
                                        release_date: result['release_date'])
    end
  end
end

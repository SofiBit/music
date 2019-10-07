# frozen_string_literal: true

module Comments
  def model(type)
    object = nil
    [Comment, Playlist, Track].each do |model|
      object = model if model.to_s == type
    end
    object
  end

  # def sort_comments(comments)
  #   comments.order('created_at asc').to_a
  # end
end

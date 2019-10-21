# frozen_string_literal: true

module Comments
  def model(type)
    object = nil
    [Comment, Playlist, Track].each do |model|
      object = model if model.to_s == type
    end
    object
  end
end

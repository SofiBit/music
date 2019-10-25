# frozen_string_literal: true

module Comments
  def model(type)
    [Comment, Playlist, Track].select do |model|
      model.to_s == type
    end.first
  end
end

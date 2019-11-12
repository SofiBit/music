# frozen_string_literal: true

module AssessmentModel
  def model(type)
    [Playlist, Track].select do |model|
      model.to_s == type
    end.first
  end
end

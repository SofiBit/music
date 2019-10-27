# frozen_string_literal

module SearchHelper
  def get_object(object_type, object_id)
    model(object_type).find(object_id)
  end

  def model(object_type)
    models = [Playlist, Track].select { |model| model.to_s == object_type }
    models.first
  end
end

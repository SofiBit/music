class AddTrackImageToTracks < ActiveRecord::Migration[5.2]
  def change
    add_column :tracks, :track_image, :string
  end
end

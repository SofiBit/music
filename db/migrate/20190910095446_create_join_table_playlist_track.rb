class CreateJoinTablePlaylistTrack < ActiveRecord::Migration[5.2]
  def change
    create_join_table :playlists, :tracks do |t|
      t.references :playlist
      t.references :track
    end
  end
end

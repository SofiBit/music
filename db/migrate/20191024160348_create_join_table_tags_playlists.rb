class CreateJoinTableTagsPlaylists < ActiveRecord::Migration[5.2]
  def change
    create_join_table :tags, :playlists do |t|
      t.index [:tag_id, :playlist_id]
      t.index [:playlist_id, :tag_id]
    end
  end
end

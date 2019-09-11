class CreatePlaylistSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :playlist_subscriptions do |t|
      t.references :playlist, foreign_key: true
      t.references :user, foreign_key: true
    end
  end
end

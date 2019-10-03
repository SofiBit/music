class AddColumnToPlaylists < ActiveRecord::Migration[5.2]
  def change
    add_column :playlists, :private, :boolean, default: false
  end
end

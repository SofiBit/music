class AddColumnToAddingTracks < ActiveRecord::Migration[5.2]
  def change
    add_column :adding_tracks, :private, :boolean, default: false
  end
end

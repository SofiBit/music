class CreateAddingTracks < ActiveRecord::Migration[5.2]
  def change
    create_table :adding_tracks do |t|
      t.references :playlist, foreign_key: true
      t.references :track, foreign_key: true
    end
  end
end

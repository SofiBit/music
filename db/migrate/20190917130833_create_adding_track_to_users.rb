class CreateAddingTrackToUsers < ActiveRecord::Migration[5.2]
  def self.up
    create_table :adding_track_to_users do |t|
      t.references :user, foreign_key: true
      t.references :track, foreign_key: true

      t.timestamps
    end

    remove_reference :tracks, :user, index: true, foreign_key: true
  end

  def self.down
    drop_table :adding_track_to_users

    add_reference :tracks, :user, foreign_key: true
  end
end

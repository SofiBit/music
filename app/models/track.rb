class Track < ApplicationRecord
  belongs_to :user

  has_many :playlists_tracks
  has_many :playlists, through: :playlists_tracks
end

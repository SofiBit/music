class Track < ApplicationRecord
  belongs_to :user

  has_many :adding_tracks
  has_many :playlists, through: :adding_tracks
end

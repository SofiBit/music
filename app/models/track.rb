class Track < ApplicationRecord
  mount_uploader :track_image, TrackImageUploader
  belongs_to :user

  has_many :adding_tracks, dependent: :nullify
  has_many :playlists, through: :adding_tracks
end

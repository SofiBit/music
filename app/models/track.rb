class Track < ApplicationRecord
  mount_uploader :track_image, TrackImageUploader

  has_many :adding_track_to_users
  has_many :users, through: :adding_track_to_users
  has_many :adding_tracks, dependent: :nullify
  has_many :playlists, through: :adding_tracks

  # TODO: scope :find_track, ->(result) { find_by(artist: result[:info][:artist],
  #                                         name: result[:info][:name]) }
  def self.find_track(result)
    find_by(artist: result[:info][:artist], name: result[:info][:name])
  end

  def self.already_exist?(result)
    track = find_track(result)
    track.present?
  end
end

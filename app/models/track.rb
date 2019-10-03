class Track < ApplicationRecord
  mount_uploader :track_image, TrackImageUploader

  has_many :assessments, dependent: :destroy
  has_many :adding_track_to_users
  has_many :users, through: :adding_track_to_users
  has_many :adding_tracks, dependent: :nullify
  has_many :playlists, through: :adding_tracks
  has_many :comments, as: :object, dependent: :destroy

  # TODO: scope :find_track, ->(result) { find_by(artist: result[:info][:artist],
  #                                         name: result[:info][:name]) }

  scope :public_tracks, -> { where(private: false) }

  def self.find_track(result)
    find_by(artist: result[:info][:artist], name: result[:info][:name])
  end

  def self.already_exist?(result)
    track = find_track(result)
    track.present?
  end

  def average_assessment
    amount = 0
    assessments.each do |assessment|
      amount += assessment.stars
    end
    amount.to_f / assessments.count
  end
end

class Track < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  # mount_uploader :track_image, TrackImageUploader

  has_many :adding_track_to_users
  has_many :users, through: :adding_track_to_users
  has_many :adding_tracks, dependent: :nullify
  has_many :playlists, through: :adding_tracks
  has_many :comments, as: :object, dependent: :destroy
  has_many :tags, as: :obj, dependent: :destroy
  has_many :assessments, as: :track_playlist, dependent: :destroy

  settings do
    mappings dynamic: false do
      indexes :name, type: :text, analyzer: :english
      indexes :artist, type: :text, analyzer: :english
      indexes :album, type: :text, analyzer: :english
      indexes :tags do
        indexes :name
      end
    end
  end

  def self.find_track(link)
    track = find_by(link: link.to_s)
    return track if track.present?

    Track.all.select do |track|
      JSON.parse(track.provider_links).values.include?(link.to_s)
    end.first
  end

  def self.already_exist?(link)
    track = Track.find_track(link.to_s)
    track.present?
  end

  def self.exist_track?(link)
    track = Track.find_track(link.to_s)
    track.nil?
  end
end

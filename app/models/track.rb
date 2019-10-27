class Track < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
  mount_uploader :track_image, TrackImageUploader

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

  def self.find_track(result)
    find_by(artist: result[:info][:artist], name: result[:info][:name])
  end

  def self.already_exist?(result)
    track = find_track(result)
    track.present?
  end
end

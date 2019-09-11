class Playlist < ApplicationRecord
  belongs_to :user

  has_many :playlists_tracks, dependent: :destroy
  has_many :tracks, through: :playlists_tracks
  has_many :playlist_subscriptions, dependent: :destroy
  has_many :subscribers, through: :playlist_subscriptions, source: :user

  validates :title, presence: true

  def users
  end
end

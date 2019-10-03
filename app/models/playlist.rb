class Playlist < ApplicationRecord
  belongs_to :user

  has_many :adding_tracks, dependent: :destroy
  has_many :tracks, through: :adding_tracks
  has_many :playlist_subscriptions, dependent: :destroy
  has_many :subscribers, through: :playlist_subscriptions, source: :user
  has_many :comments, as: :object, dependent: :destroy

  validates :title, presence: true

  scope :public_playlists, -> { where(private: false) }
end

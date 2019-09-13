class Playlist < ApplicationRecord
  belongs_to :user

  has_many :adding_tracks, dependent: :destroy
  has_many :tracks, through: :adding_tracks
  has_many :playlist_subscriptions, dependent: :destroy
  has_many :subscribers, through: :playlist_subscriptions, source: :user

  validates :title, presence: true

  def users
  end
end

class Playlist < ApplicationRecord
  belongs_to :user

  has_many :adding_tracks, dependent: :destroy
  has_many :tracks, through: :adding_tracks
  has_many :playlist_subscriptions, dependent: :destroy
  has_many :subscribers, through: :playlist_subscriptions, source: :user
  has_many :comments, as: :object, dependent: :destroy
  has_many :tags, as: :object, dependent: :destroy

  after_create_commit { create_notice_about_new_playlist }

  validates :title, presence: true

  scope :public_playlists, -> { where(private: false) }

  def public_tracks
    adding_tracks = self.adding_tracks.where(private: false)
    adding_tracks.map(&:track)
  end

  private

  def create_notice_about_new_playlist
    user.followers.each do |follower|
      follower.notifications.create(message: "#{user.first_name} created\
        new playlist #{self.title}", sender: user)
    end
  end
end

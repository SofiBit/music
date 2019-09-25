class AddingTrack < ApplicationRecord
  belongs_to :playlist
  belongs_to :track

  after_create_commit { create_notice_about_new_song }

  private

  def create_notice_about_new_song
    playlist.subscribers.each do |user|
      user.notifications.create(message: "#{playlist.user.first_name} added a \
        new track to the playlist #{playlist.title}", sender: playlist.user)
    end
  end
end

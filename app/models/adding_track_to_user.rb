class AddingTrackToUser < ApplicationRecord
  belongs_to :user
  belongs_to :track

  after_create_commit { create_notice_about_new_track }

  private

  def create_notice_about_new_track
    user.followers.each do |follower|
      follower.notifications.create(message: "#{user.first_name} added new track", sender: user)
    end
  end
end

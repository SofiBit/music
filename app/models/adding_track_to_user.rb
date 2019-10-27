class AddingTrackToUser < ApplicationRecord
  include Notifications
  
  belongs_to :user
  belongs_to :track

  after_create_commit { create_notice_about_new_track(user) }
end

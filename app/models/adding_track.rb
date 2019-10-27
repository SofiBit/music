class AddingTrack < ApplicationRecord
  include Notifications
  
  belongs_to :playlist
  belongs_to :track

  after_create_commit { create_notice_about_new_song(playlist, track) }
end

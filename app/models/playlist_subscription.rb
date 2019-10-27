class PlaylistSubscription < ApplicationRecord
  include Notifications
  
  after_create_commit { create_notice_about_subscription_on_playlist(playlist, user) }
  after_destroy { create_notice_about_unsubscription_from_playlist(playlist, user) }

  belongs_to :playlist
  belongs_to :user
end

class AddingTrackToUser < ApplicationRecord
  belongs_to :user
  belongs_to :track

  scope :count_adding, ->(track) { where(track: track).count }
end

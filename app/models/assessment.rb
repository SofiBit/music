class Assessment < ApplicationRecord
  belongs_to :user
  belongs_to :track_playlist, polymorphic: true
end

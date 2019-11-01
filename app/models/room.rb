class Room < ApplicationRecord
  has_many :room_messages, dependent: :destroy
  has_and_belongs_to_many :users

  def self.find_room(user_first, user_second)
    includes(:users).find do |room|
      room.users.include?(user_first) && room.users.include?(user_second)
    end
  end
end

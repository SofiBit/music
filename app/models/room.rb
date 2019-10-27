class Room < ApplicationRecord
  has_many :room_messages, dependent: :destroy
  has_and_belongs_to_many :users
  
  validate :count_user, on: :update

  def count_user
    return unless private_messages? || users.count >= 2

    errors.add(:user, 'already 2')
  end
end

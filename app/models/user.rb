class User < ApplicationRecord
  ROLES = %i[user admin]

  has_many :tracks, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :events, dependent: :destroy

  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :validatable,
          :trackable

  def admin?
    self.role == "admin"
  end

  def friends
    friends_id = []
    friendships.each { |friendship| friends_id << friendship.friend_id }
    friends = []
    friends_id.each do |id|
      friends << User.find(id)
    end
    friends
  end

  def status_with_friend(user)
    friendship = friendships.find_by(friend_id: user.id)
    friendship_user = user.friendships.find_by(friend_id: id)
    friendship.update(status: 1) if user.friends.include?(self)
    friendship_user.update(status: 1) if self.friends.include?(user) && friendship_user != nil
  end

  def has_new_notice?
    unless events.empty? || events.last.status == 'checked'
      return true
    end

    false
  end
end

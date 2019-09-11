class User < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search_users, against: [:first_name, :last_name]

  ROLES = %i[user admin]

  has_many :tracks, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :notifications
  has_many :playlists
  has_many :playlist_subscriptions
  has_many :playlists_by_friends, through: :playlist_subscriptions, source: :playlist

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
    unless notifications.empty? || notifications.last.status == 'checked'
      return true
    end

    false
  end
end

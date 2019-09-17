class User < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search_users, against: [:first_name, :last_name]

  ROLES = %i[user admin]

  has_many :tracks, dependent: :destroy
  # TODO: has_many :friendships, dependent: :destroy
  has_many :notifications
  has_many :playlists
  has_many :playlist_subscriptions
  has_many :playlists_by_friends, through: :playlist_subscriptions, source: :playlist

  # TODO: validates :first_name, :last_name, presence: true

  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :validatable,
          :trackable,
          :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def admin?
    self.role == "admin"
  end

  def has_subscription_on_all_playlists?(user)
    answer = false
    user.playlists.each do |playlist|
      answer = playlists_by_friends.include?(playlist)
      break if answer == false
    end
    answer
  end

  def has_new_notice?
    unless notifications.empty? || notifications.last.status == 'checked'
      return true
    end

    false
  end
end

class User < ApplicationRecord
  include PgSearch::Model

  pg_search_scope :search_users, against: [:first_name, :last_name]

  ROLES = %i[user admin]

  has_many :assessments, dependent: :destroy
  has_many :adding_track_to_users
  has_many :tracks, through: :adding_track_to_users
  has_many :user_subscriptions, dependent: :destroy
  has_many :following, through: :user_subscriptions, source: :subscription
  has_many :inverse_user_subscriptions, class_name: "UserSubscription", foreign_key: "subscription_id"
  has_many :followers, through: :inverse_user_subscriptions, source: :user
  has_many :notifications
  has_many :playlists
  has_many :playlist_subscriptions
  has_many :playlists_by_friends, through: :playlist_subscriptions, source: :playlist
  has_many :comments
  has_many :room_messages
  has_and_belongs_to_many :rooms

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
end

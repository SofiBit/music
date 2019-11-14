class User < ApplicationRecord
  ROLES = %i[user admin]

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  mount_uploader :avatar, AvatarUploader

  settings do
    mapping dynamic: false do
      indexes :first_name, type: :text, analyzer: :english
      indexes :last_name, type: :text, analyzer: :english
    end
  end

  has_many :assessments, dependent: :destroy
  has_many :adding_track_to_users
  has_many :tracks, through: :adding_track_to_users
  has_many :user_subscriptions, dependent: :destroy
  has_many :following, through: :user_subscriptions, source: :subscription
  has_many :inverse_user_subscriptions, class_name: "UserSubscription", foreign_key: "subscription_id"
  has_many :followers, through: :inverse_user_subscriptions, source: :user
  has_many :notifications, dependent: :destroy
  has_many :playlists
  has_many :playlist_subscriptions
  has_many :playlists_by_friends, through: :playlist_subscriptions, source: :playlist
  has_many :comments
  has_many :room_messages
  has_and_belongs_to_many :rooms

  validates :first_name, :last_name, presence: true
  validates :nickname, uniqueness: true

  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :validatable,
          :trackable,
          # :confirmable,
          :omniauthable, :omniauth_providers => [:facebook]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create! do |user|
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

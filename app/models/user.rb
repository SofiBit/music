class User < ApplicationRecord
  ROLES = %i[user admin]

  has_many :tracks, dependent: :destroy

  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :validatable,
          :trackable

  def admin?
    self.role == "admin"
  end
end

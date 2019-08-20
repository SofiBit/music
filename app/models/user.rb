class User < ApplicationRecord
  ROLES = %i[user admin]

  has_many :source_links, dependent: :destroy

  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :validatable,
          :trackable
          # :confirmable

  def admin?
    self.role == "admin"
  end
end

class User < ApplicationRecord
  has_many :source_links, dependent: :destroy

  devise  :database_authenticatable,
          :registerable,
          :recoverable,
          :rememberable,
          :validatable,
          :trackable,
          :confirmable
end

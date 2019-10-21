class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :object, polymorphic: true

  has_many :comments, as: :object, dependent: :destroy

  validates :body, presence: true
end
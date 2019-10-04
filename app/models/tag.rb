class Tag < ApplicationRecord
  belongs_to :object, polymorphic: true

  validates :name, format: { with: /\A#\w+/, message: "format: #tag" }
  validates :name, length: { in: 2..20 }

  scope :search_obj, ->(tag_name) { where(name: tag_name) }
end

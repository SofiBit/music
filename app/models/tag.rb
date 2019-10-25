require 'elasticsearch/model'

class Tag < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  has_and_belongs_to_many :playlists

  validates :name, format: { with: /\A#\w+/, message: "format: #tag" }
  validates :name, length: { in: 2..20 }
  validates :name, presence: true
end

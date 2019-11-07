class Playlist < ApplicationRecord
  include Notifications
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
  mount_uploader :image, PlaylistImageUploader

  belongs_to :user

  has_many :adding_tracks, dependent: :destroy
  has_many :tracks, through: :adding_tracks
  has_many :playlist_subscriptions, dependent: :nullify
  has_many :subscribers, through: :playlist_subscriptions, source: :user, dependent: :destroy
  has_many :comments, as: :object, dependent: :destroy
  has_many :assessment, as: :track_playlist, dependent: :destroy
  has_and_belongs_to_many :tags

  after_create_commit { create_notice_about_new_playlist(user, self) }

  validates :title, presence: true

  scope :public_playlists, -> { where(private: false) }

  settings do
    mappings dynamic: false do
      indexes :title, type: :text, analyzer: :english
      indexes :private, type: :boolean
      indexes :tags do
        indexes :name
      end
    end
  end

  def as_indexed_json(options={})
    self.as_json(
      include: { tags: { only: :name} }
    )
  end

  def self.search_public(query)
    self.search({
     query: {
       bool: {
         must: [
         {
           multi_match: {
             query: query,
             fields: [:title],
             fuzziness: 'auto',
             lenient: 'true'
           }
         },
         {
           match: {
             private: false
           }
         }]
       }
     }
   })
  end

  def public_tracks
    adding_tracks = self.adding_tracks.where(private: false)
    adding_tracks.map(&:track)
  end

  def public?
    self.private == false
  end
end

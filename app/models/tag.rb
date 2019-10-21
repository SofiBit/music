class Tag < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :obj, polymorphic: true

  validates :name, format: { with: /\A#\w+/, message: "format: #tag" }
  validates :name, length: { in: 2..20 }

  settings do
     mappings dynamic: false do
       indexes :obj, type: :text, analyzer: :english
       indexes :name, type: :text, analyzer: :english
     end
   end

   def self.search_tag(query)
     search(
      query: {
        bool: {
          must: [
            {
              multi_match: {
                query: query,
                fields: %i[name obj_id],
                fuzziness: 'auto',
                lenient: 'true'
              }
            }
          ]
        }
      }
    )
   end
end

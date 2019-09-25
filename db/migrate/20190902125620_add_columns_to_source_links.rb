class AddColumnsToSourceLinks < ActiveRecord::Migration[5.2]
  def change
    add_column :source_links, :artist, :string
    add_column :source_links, :name, :string
    add_column :source_links, :album, :string
    add_column :source_links, :release_date, :string
    add_column :source_links, :provider_links, :json
  end
end

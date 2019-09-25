class RenameSourceLinks < ActiveRecord::Migration[5.2]
  def self.up
    rename_table :source_links, :tracks
  end

  def self.down
    rename_table :tracks, :source_links
  end
end

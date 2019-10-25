class RemoveReferenceFromTags < ActiveRecord::Migration[5.2]
  def self.up
    remove_reference :tags, :obj, polymorphic: true
  end

  def self.down
    add_references :tags, :obj, polymorphic: true
  end
end

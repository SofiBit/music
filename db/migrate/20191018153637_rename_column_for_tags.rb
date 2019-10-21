class RenameColumnForTags < ActiveRecord::Migration[5.2]
  def change
    rename_column :tags, :object_id, :obj_id
    rename_column :tags, :object_type, :obj_type
  end
end

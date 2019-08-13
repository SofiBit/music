class CreateSourceLinks < ActiveRecord::Migration[5.2]
  def change
    create_table :source_links do |t|
      t.text :link
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end

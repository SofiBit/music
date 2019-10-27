class CreateRooms < ActiveRecord::Migration[5.2]
  def change
    create_table :rooms do |t|
      t.string :name
      t.boolean :private_messages, default: true

      t.timestamps
    end
  end
end

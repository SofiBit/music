class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :message
      t.string :status, default: 'unchecked'
      t.references :user, foreign_key: true
      t.references :sender, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end

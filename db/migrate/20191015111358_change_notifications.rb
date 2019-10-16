class ChangeNotifications < ActiveRecord::Migration[5.2]
  def change
    add_column :notifications, :link, :string
    remove_column :notifications, :status
  end
end

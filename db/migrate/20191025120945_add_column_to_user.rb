class AddColumnToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string
    add_column :users, :avatar, :string
    add_column :users, :date_birthday, :string
    add_column :users, :address, :string
  end
end

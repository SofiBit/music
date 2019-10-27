class CreateJoinTableUsersRooms < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :rooms do |t|
      t.index [:user_id, :room_id]
      t.index [:room_id, :user_id]
    end
  end
end

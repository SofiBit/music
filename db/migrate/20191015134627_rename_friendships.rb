class RenameFriendships < ActiveRecord::Migration[5.2]
  def change
    rename_table :friendships, :user_subscriptions
    rename_column :user_subscriptions, :friend_id, :subscription_id
  end
end

class FriendshipsController < ApplicationController
  def create
    @user = User.find(params[:friend])
    current_user.friendships.create(friend_id: @user.id)
    current_user.status_with_friend(@user)
    respond_to { |format| format.js }
  end

  def destroy
    @user = User.find(params[:id])
    current_user.friendships.find_by(friend_id: @user.id).delete
  end
end

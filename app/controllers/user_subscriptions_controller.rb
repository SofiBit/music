class UserSubscriptionsController < ApplicationController
  before_action :find_subscription, only: :destroy

  def create
    @user = User.find(params[:user_id])
    @subscription = current_user.user_subscriptions.create(subscription: @user)
    respond_to { |format| format.js }
  end

  def destroy
    @user = User.find(@subscription.subscription.id)
    @subscription.destroy
    respond_to { |format| format.js }
  end

  private

  def find_subscription
    @subscription = UserSubscription.find(params[:id])
  end
end

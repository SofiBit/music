class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, only: %i[show edit update]

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render :edit 
    end
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit( :first_name, :last_name, :nickname,
                                  :avatar, :address, :date_birthday)
  end
end

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit, :update, :edit_profile, :update_profile]
  
  def show
  end

  def edit
    @user = current_user
  end

  def edit_profile
    @user = current_user
  end

  def update_profile
    if @user.update(user_params)
      redirect_to @user, notice: 'プロフィールが更新されました。'
    else
      render :edit_profile
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'プロフィールが更新されました。'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = current_user
    Rails.logger.debug "Current User: #{@user.inspect}" 
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :avatar, :bio)
  end
end


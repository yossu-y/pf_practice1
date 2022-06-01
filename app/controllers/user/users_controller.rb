class User::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def edit
  end

  def update
  end

  def unsubscribe
  end

  def withdraw
  end

  private

  def user_params
    params.require(:user).permit(:screen_name, :introduction, :email)
  end

end

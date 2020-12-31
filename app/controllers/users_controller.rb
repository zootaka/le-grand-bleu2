class UsersController < ApplicationController
  def index
    # @log_books = LogBook.includes(:user)
    @user = User.find(current_user.id)
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(params[:id])
    if @user.update(set_params)
      redirect_to users_path(current_user.id)
    else
      render :index
    end
  end

  private

  def set_params
    params.require(:user).permit(:avatar, :nickname, :email, :self_introduction)
  end
end

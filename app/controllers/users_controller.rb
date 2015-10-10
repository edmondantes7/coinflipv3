class UsersController < ApplicationController
  def new

  end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to @user
    #render plain: params[:user].inspect
  end

  def show
    render plain: @user
  end

  private
    def user_params
      params.require(:user).permit(:name)
    end
end

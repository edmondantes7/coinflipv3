class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.balance = Constants::STARTING_BALANCE
    @user.save
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
    #render plain: params[:user].inspect
  end

  def show
    @user = User.find(params[:id])
  end

  private
    def user_params
      params.require(:user).permit(:name)
    end
end

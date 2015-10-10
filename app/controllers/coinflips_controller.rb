class CoinflipsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @coinflip = @user.coinflips.create(user_params)
    @coinflip.coin_result = [true, false].sample
    @coinflip.save
    # TODO call on user to compute based on bet, coin result and decision
    redirect_to user_path(@user)
  end
 
  private
    def user_params
      params.require(:coinflip).permit(:bet)
    end
end

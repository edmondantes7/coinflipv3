class CoinflipsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @coinflip = @user.coinflips.create(user_params)
    @coinflip.coin_result = [true, false].sample
    @coinflip.save
    @user.update_balance(@coinflip.bet, @coinflip.coin_result == @coinflip.winning_flip)
    @user.save
    redirect_to user_path(@user)
  end
 
  private
    def user_params
      params.require(:coinflip).permit(:bet, :winning_flip)
    end
end

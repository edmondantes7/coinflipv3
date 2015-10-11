class CoinflipsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @coinflip = @user.coinflips.new(user_params)
    if @user.balance_is_less_than_bet(@coinflip.bet) then
      flash[:error] = "Bet must be less than or equal to your balance"
      redirect_to user_path(@user) 
      return 
    end
    @coinflip.coin_result = [true, false].sample
    @user.update_balance(@coinflip.bet, @coinflip.coin_result == @coinflip.winning_flip)
    @coinflip.save
    @user.save

    if @user.check_if_game_should_continue then
      redirect_to user_path(@user)
    else
      flash[:notice] = "Thanks for playing!"
      redirect_to root_path
    end
  end
 
  private
    def user_params
      params.require(:coinflip).permit(:bet, :winning_flip)
    end
end

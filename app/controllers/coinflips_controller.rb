class CoinflipsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @coinflip = @user.coinflips.create(user_params)
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

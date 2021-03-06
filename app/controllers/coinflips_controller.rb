class CoinflipsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    durationOfGame = Constants::GAME_MINUTE_DURATION.minutes + Constants::GAME_SECOND_DURATION.seconds
    timePassed = Time.now - durationOfGame
    if ((Time.now - durationOfGame) > @user.created_at) then
      redirect_to url_for(:controller => :surveys, :action => :new)
      return
    end

    @coinflip = @user.coinflips.new(user_params)
    if @user.balance_is_less_than_bet(@coinflip.bet) then
      flash[:error] = "Bet must be less than or equal to your balance"
      redirect_to user_path(@user) 
      return 
    end
    threshold_value=39
    @coinflip.coin_result = rand(100)>threshold_value
    @user.update_balance(@coinflip.bet, @coinflip.coin_result == @coinflip.winning_flip)
    @coinflip.balance = @user.balance
    @coinflip.save
    @user.save

    if @user.check_if_game_should_continue then
      redirect_to user_path(@user)
    else
      redirect_to url_for(:controller => :surveys, :action => :new)
    end
  end
 
  private
    def user_params
      params.require(:coinflip).permit(:bet, :winning_flip)
    end
end

class User < ActiveRecord::Base
  has_many :coinflips

  def last_coin_flip_exists
    return self.coinflips.order(:created_at).last
  end

  def last_coin_flip_result
    last_coin_flip = last_coin_flip_exists
    return "Please flip" if !last_coin_flip
    return "Head" if last_coin_flip.coin_result
    return "Tail"
  end

  def update_balance(bet_amount, did_win)
    delta = bet_amount
    delta = delta * -1 if did_win == false
    self.balance = self.balance + delta
  end

  def check_if_game_should_continue
    return self.balance >= 1
  end
end

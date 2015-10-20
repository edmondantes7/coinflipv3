class User < ActiveRecord::Base
  acts_as_xlsx
  has_many :coinflips
  has_one  :survey

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
    self.balance >= 1
  end

  def balance_is_less_than_bet(bet)
    self.balance < bet
  end

  def self.to_csv(options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      all.each do |user|
        csv << user.attributes.values_at(*column_names)
      end
    end
  end
end

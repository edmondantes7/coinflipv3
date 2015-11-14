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
    return "Heads" if last_coin_flip.coin_result
    return "Tails"
  end

  def update_balance(bet_amount, did_win)
    begin
      delta = 1.0 * bet_amount
      delta = delta * -1.0 if did_win == false
      self.balance = self.balance + delta
    rescue
      self.balance = self.balance
    end
  end

  def check_if_game_should_continue
    self.balance > 0
  end

  def balance_is_less_than_bet(bet)
    begin
      self.balance < bet
    rescue
      false
    end
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

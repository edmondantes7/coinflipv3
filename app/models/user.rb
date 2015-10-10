class User < ActiveRecord::Base
  has_many :coinflips
  #attr_accessible :balance

  def last_coin_flip_result
    something = self.coinflips.order(:created_at)
    require 'pry'
    binding.pry
    return "tail" if self.coinflips.order(:created_at).last.coin_result
    return "head"
  end
end

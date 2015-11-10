class Coinflip < ActiveRecord::Base
  acts_as_xlsx
  belongs_to :user

  def convert(flip)
  	if flip then
  		return "Heads"
  	else
  		return "Tails"
  	end
  end
end

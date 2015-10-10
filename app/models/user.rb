class User < ActiveRecord::Base
  has_many :coinflips
  #attr_accessible :balance
end

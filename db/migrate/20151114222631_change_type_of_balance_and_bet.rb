class ChangeTypeOfBalanceAndBet < ActiveRecord::Migration
  def change
  	change_column :coinflips, :bet, :decimal
  	change_column :coinflips, :balance, :decimal
  end
end

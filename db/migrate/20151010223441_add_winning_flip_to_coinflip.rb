class AddWinningFlipToCoinflip < ActiveRecord::Migration
  def change
    add_column :coinflips, :winning_flip, :boolean
  end
end

class CreateCoinflips < ActiveRecord::Migration
  def change
    create_table :coinflips do |t|
      t.integer :bet
      t.boolean :coin_result
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

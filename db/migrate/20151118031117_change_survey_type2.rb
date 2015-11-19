class ChangeSurveyType2 < ActiveRecord::Migration
  def change

  	add_column :surveys, :how_much_response, :string
  	add_column :surveys, :exp_min_response, :string
  	add_column :surveys, :stock_how_response, :string
  	add_column :surveys, :stock_response, :string
  	add_column :surveys, :general_comments, :string
    add_column :surveys, :own_money_response, :boolean
    add_column :surveys, :thought_response, :boolean
  end
end

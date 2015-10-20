class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string :test_for_response, :done_diff_response
      t.boolean :fam_with_response, :was_fair_response
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

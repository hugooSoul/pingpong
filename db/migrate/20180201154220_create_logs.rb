class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.references :user, index: true, foreign_key: true
      t.datetime :date, null: false
      t.string :oponent, null: false
      t.integer :my_score
      t.integer :their_score
    end
  end
end

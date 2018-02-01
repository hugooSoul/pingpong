class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.references :user, index: true, foreign_key: true
      t.datetime :date, null: false
      t.integer :oponent
      t.integer :my_score
      t.integer :their_score
    end
  end
end

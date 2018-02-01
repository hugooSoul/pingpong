class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
      t.references :user, index: true, foreign_key: true
      t.integer :score
    end
  end
end

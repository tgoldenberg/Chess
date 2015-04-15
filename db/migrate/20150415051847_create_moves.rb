class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.string :notation
      t.references :room, index: true, foreign_key: true
      t.string :piece

      t.timestamps null: false
    end
  end
end

class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :fen
      t.references :move, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end

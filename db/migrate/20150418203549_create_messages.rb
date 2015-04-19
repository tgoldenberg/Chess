class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :sender_id
      t.integer :recipient_id
      t.references :conversation, index: true, foreign_key: true
      t.text :body

      t.timestamps null: false
    end
  end
end

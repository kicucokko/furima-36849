class CreateReceivers < ActiveRecord::Migration[6.0]
  def change
    create_table :receivers do |t|
      t.string :zip,             null: false
      t.integer :prefecture_id,  null: false
      t.string :city,            null: false
      t.string :block,           null: false
      t.string :build
      t.string :phone,           null: false
      t.references :purchase,    null: false, foreign_key: true
      t.timestamps
    end
  end
end

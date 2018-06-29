class CreateStockLists < ActiveRecord::Migration[5.1]
  def change
    create_table :stock_lists do |t|
      t.string :stock
      t.string :bearer
      t.string :currency
      t.integer :value_cents

      t.timestamps
    end
  end
end

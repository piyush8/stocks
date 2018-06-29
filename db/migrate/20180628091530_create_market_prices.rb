class CreateMarketPrices < ActiveRecord::Migration[5.1]
  def change
    create_table :market_prices do |t|
      t.string :currency
      t.string :value_cents
      t.string :integer

      t.timestamps
    end
  end
end

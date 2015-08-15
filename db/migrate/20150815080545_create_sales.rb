class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :item_id
      t.integer :quantity
      t.integer :amount
      t.datetime :sold_date
      t.string :code
      t.integer :channel_id

      t.timestamps null: false
    end
  end
end

class CreateBids < ActiveRecord::Migration
  def change
    create_table :bids do |t|
      t.integer :bid_price
      t.references :user, index: true
      t.references :product, index: true

      t.timestamps null: false
    end
    add_foreign_key :bids, :users
    add_foreign_key :bids, :products
  end
end

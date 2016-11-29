class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.references :user
      t.string :tier
      t.string :title
      t.string :description
      t.integer :reserve_price
      t.integer :guaranteed_price
      t.integer :winning_bid
      t.integer :winner_id

      t.timestamps
    end
  end
end

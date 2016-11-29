class CreateBids < ActiveRecord::Migration[5.0]
  def change
    create_table :bids do |t|
      t.references :user
      t.references :listing
      t.integer :amount


      t.timestamps
    end
  end
end

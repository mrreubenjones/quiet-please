class AddRaisedColumnToAuctions < ActiveRecord::Migration[5.0]
  def change
    add_column :auctions, :raised, :integer
  end
end

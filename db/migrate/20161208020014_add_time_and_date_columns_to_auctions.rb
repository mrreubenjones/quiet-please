class AddTimeAndDateColumnsToAuctions < ActiveRecord::Migration[5.0]
  def change
    add_column :auctions, :start_date, :date
  end
end

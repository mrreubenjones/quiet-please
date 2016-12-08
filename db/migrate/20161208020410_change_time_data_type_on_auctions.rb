class ChangeTimeDataTypeOnAuctions < ActiveRecord::Migration[5.0]
  def change
    remove_column :auctions, :opening_time, :datetime
    remove_column :auctions, :closing_time, :datetime
    add_column :auctions, :opening_time, :time
    add_column :auctions, :closing_time, :time
  end
end

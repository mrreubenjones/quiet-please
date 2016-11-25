class CreateAuctions < ActiveRecord::Migration[5.0]
  def change
    create_table :auctions do |t|
      t.string :name
      t.text :description
      t.datetime :opening_time
      t.datetime :closing_time

      t.timestamps
    end
  end
end

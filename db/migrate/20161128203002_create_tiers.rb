class CreateTiers < ActiveRecord::Migration[5.0]
  def change
    create_table :tiers do |t|
      t.references :auction
      t.string :name
      t.text :description
      t.integer :opening_time
      t.integer :closing_time

      t.timestamps
    end
  end
end

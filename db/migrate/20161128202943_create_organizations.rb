class CreateOrganizations < ActiveRecord::Migration[5.0]
  def change
    create_table :organizations do |t|
      t.references :user
      t.string :name
      t.text :description
      t.integer :phone
      t.string :email
      t.string :website

      t.timestamps
    end
  end
end

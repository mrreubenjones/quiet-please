class ChangeColumnForImagesInListings < ActiveRecord::Migration[5.0]
  def change
    remove_column :listings, :images, :json
    add_column :listings, :images, :string, array: true, default: []
  end
end

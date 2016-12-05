class AddAuctionAndTierReferencesToListings < ActiveRecord::Migration[5.0]
  def change
    add_reference :listings, :auction, foreign_key: true, index: true
    add_reference :listings, :tier, foreign_key: true, index: true
  end
end

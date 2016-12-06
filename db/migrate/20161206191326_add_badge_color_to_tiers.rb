class AddBadgeColorToTiers < ActiveRecord::Migration[5.0]
  def change
    add_column :tiers, :badge_color, :string
  end
end

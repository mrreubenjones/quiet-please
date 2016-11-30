class ChangeStatusColumnNameInAuctions < ActiveRecord::Migration[5.0]
  def change
    rename_column :auctions, :status, :aasm_state
  end
end

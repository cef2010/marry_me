class AddBoolToContracts < ActiveRecord::Migration
  def change
    add_column(:contracts, :couple_pending, :boolean, :default => true)
    add_column(:contracts, :vendor_pending, :boolean, :default => true)
  end
end

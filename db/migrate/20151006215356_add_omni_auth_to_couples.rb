class AddOmniAuthToCouples < ActiveRecord::Migration
  def change
    add_column :couples, :provider, :string
    add_index :couples, :provider
    add_column :couples, :uid, :string
    add_index :couples, :uid
  end
end

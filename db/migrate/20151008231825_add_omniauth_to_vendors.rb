class AddOmniauthToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :provider, :string
    add_index :vendors, :provider
    add_column :vendors, :uid, :string
    add_index :vendors, :uid
  end
end

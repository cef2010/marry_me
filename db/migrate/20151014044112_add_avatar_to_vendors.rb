class AddAvatarToVendors < ActiveRecord::Migration
  def self.up
    change_table :vendors do |t|
      t.attachment :vendor_avatar
    end
  end

  def self.down
    drop_attached_file :vendors, :vendor_avatar
  end
end

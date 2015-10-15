class AddAvatarToCouples < ActiveRecord::Migration
  def self.up
    change_table :couples do |t|
      t.attachment :couple_avatar
    end
  end

  def self.down
    drop_attached_file :couples, :couple_avatar
  end
end

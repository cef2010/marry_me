class AddNameToCouple < ActiveRecord::Migration
  def change
    add_column :couples, :name, :string
  end
end

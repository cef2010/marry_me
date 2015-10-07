class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.text :description
      t.string :type
      t.string :address
      t.string :website
      t.string :phone

      t.timestamps null: false
    end
  end
end

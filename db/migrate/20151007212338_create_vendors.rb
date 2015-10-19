class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
      t.string :name
      t.text :description
      t.string :category
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :website
      t.string :phone

      t.timestamps null: false
    end
  end
end

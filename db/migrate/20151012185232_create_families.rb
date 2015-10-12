class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.string :name
      t.string :description
      t.string :contact
      t.string :role
      t.string :relation
      t.belongs_to :couple

      t.timestamps null: false
    end
  end
end

class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.datetime :date
      t.text :body
      t.string :author
      t.belongs_to :couple
      t.belongs_to :vendor 

      t.timestamps null: false
    end
  end
end

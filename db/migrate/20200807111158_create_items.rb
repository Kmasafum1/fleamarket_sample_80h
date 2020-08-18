class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :condition, null: false
      t.integer :delivery_cost,  null: false
      t.integer :sipping_area, null: false
      t.integer :sipping_days, null: false
      t.integer :price, null: false
      t.references :user, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :brand, foreign_key: true
      t.timestamps
    end
  end
end

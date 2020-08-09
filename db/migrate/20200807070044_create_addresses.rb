class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.integer :post_code, null:false
      t.integer :prefecture, null:false
      t.string :city, null:false
      t.text :address, null:false
      t.string :building_name, null:false
      t.integer :phone_number
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

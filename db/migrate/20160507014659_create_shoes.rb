class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :name
      t.string :sku
      t.decimal :price, precision: 15 , scale: 2
      t.attachment :image
      t.timestamps null: false
    end
  end
end

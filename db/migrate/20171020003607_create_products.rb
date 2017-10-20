class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :brand
      t.string :model
      t.string :sku
      t.integer :price
      t.text :desc

      t.timestamps
    end
  end
end

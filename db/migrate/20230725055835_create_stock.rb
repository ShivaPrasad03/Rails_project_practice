class CreateStock < ActiveRecord::Migration[7.0]
  def change
    create_table :stocks do |t|
      t.string :stock 
      t.integer :price
      t.timestamps
    end
  end
end

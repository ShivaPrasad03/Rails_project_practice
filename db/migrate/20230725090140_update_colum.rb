class UpdateColum < ActiveRecord::Migration[7.0]
  def change
    change_table :stocks do |t|
  
      t.remove :market_capital
      t.string :market_capital
    
    end
  end
end

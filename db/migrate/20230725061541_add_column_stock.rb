class AddColumnStock < ActiveRecord::Migration[7.0]
  def change
    add_column :stocks, :market_capital, :integer
  end
end

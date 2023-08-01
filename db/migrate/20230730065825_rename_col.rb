class RenameCol < ActiveRecord::Migration[7.0]
  def change
    rename_column :stocks, :stock, :stock_name
  end
end

class RenameStocksUserToStockUser < ActiveRecord::Migration[6.0]
  def change
    rename_table :stocks_users, :stock_users
  end
end

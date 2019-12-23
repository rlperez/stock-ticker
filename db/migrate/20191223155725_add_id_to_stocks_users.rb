class AddIdToStocksUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :stocks_users, :id, :primary_key
  end
end

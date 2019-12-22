class CreateJoinTableStockUser < ActiveRecord::Migration[6.0]
  def change
    create_join_table :users, :stocks do |t|
      # t.index [:stock_id, :user_id]
      t.index [:user_id, :stock_id], unique: true
    end
  end
end

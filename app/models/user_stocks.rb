class UserStocks < ApplicationRecord
  self.table_name = 'stocks_users'
  belongs_to :users
  belongs_to :stocks
end

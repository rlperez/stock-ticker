class StockUser < ApplicationRecord
  belongs_to :users
  belongs_to :stocks
end

class User < ApplicationRecord
  include Clearance::User

  has_many :stock_users, dependent: :destroy
  has_many :stocks, through: :stock_users
end

class HomeController < ApplicationController
  before_action :require_login

  @@client = IEX::Api::Client.new

  def index
    @stocks = current_user.stocks
  end

  def add_stock
    user = User.find_by_email(current_user.email)
    symbol = params[:symbol].to_s.upcase
    stock = Stock.find_by_symbol(symbol)
    if stock
      add_user_to_stock(symbol, user)
    else
      add_new_stock(symbol, user)
    end

    redirect_back(fallback_location: root_path)
  end

  private

  def add_user_to_stock(symbol, user)
    stock = Stock.find_by_symbol(symbol)
    stock.users << user
    stock.save
  end

  def add_new_stock(symbol, user)
    company = @@client.company(symbol)
    stock = Stock.new
    stock.symbol = company.symbol.to_s.upcase
    stock.company_name = company.company_name
    stock.exchange = company.exchange
    stock.industry = company.industry
    stock.website = company.website
    stock.description = company.description
    stock.ceo = company.ceo
    stock.issue_type = company.issue_type
    stock.sector = company.sector
    stock.users << user

    stock.save
  end
end

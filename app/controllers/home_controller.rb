class HomeController < ApplicationController
  before_action :require_login

  @@client = IEX::Api::Client.new

  def index
    @stocks = current_user.stocks
  end

  def add_stock
    company = @@client.company(params[:symbol])
    stock = Stock.new
    stock.symbol = company.symbol
    stock.company_name = company.company_name
    stock.exchange = company.exchange
    stock.industry = company.industry
    stock.website = company.website
    stock.description = company.description
    stock.ceo = company.ceo
    stock.issue_type = company.issue_type
    stock.sector = company.sector
    stock.users << User.find_by_email(current_user.email)

    stock.save

    redirect_back(fallback_location: root_path)
  end
end

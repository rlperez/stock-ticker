module HomeHelper
  @@client = IEX::Api::Client.new

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

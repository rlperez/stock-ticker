class HomeController < ApplicationController
  before_action :require_login

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
      begin
        add_new_stock(symbol, user)
      rescue IEX::Errors::SymbolNotFoundError => e
        flash[:danger] = "Symbol #{symbol} not found"
        puts "HomeHelper#add_new_stock: #{e}"
      end
    end

    redirect_back(fallback_location: root_path)
  end
end

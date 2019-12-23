class StockController < ApplicationController
  @@client = IEX::Api::Client.new

  def show
    @stock = Stock.find(params[:id])
    @chart_data = @@client.chart(@stock.symbol, config.stock_range, chart_interval: 1).reverse
  end
end

class StockController < ApplicationController
  @@client = IEX::Api::Client.new

  def show
    @stock = Stock.find(params[:id])
    @chart_data = @@client.chart(@stock.symbol, '5d', chart_interval: 1)
  end
end

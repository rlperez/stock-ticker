class HomeController < ApplicationController
  before_action :require_login

  def index
    @stocks = current_user.stocks
  end
end

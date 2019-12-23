class HomeController < ApplicationController
  before_action :require_login

  def index
    user = User.find_by_email(current_user.email)
    @stocks = user.stocks
  end
end

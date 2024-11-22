class HomeController < ApplicationController
  before_action :require_login, only: [:index]
  def index
    @users = User.all
  end

  private

  def require_login
    unless session[:user_id]
      redirect_to sign_in_users_path
    end
  end
end

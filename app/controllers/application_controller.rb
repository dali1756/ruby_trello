class ApplicationController < ActionController::Base
  # helper_method是rails內建方法，可將controller中的method直接給view使用，避免重複定義相同邏輯
  helper_method :current_user

  private
  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end
end

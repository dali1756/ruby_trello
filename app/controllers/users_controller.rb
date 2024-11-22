class UsersController < ApplicationController
  def sign_up
    @user = User.new
  end

  def sign_in
    @user = User.new
  end

  def login
    @user = User.find_by(email: params[:email])
    # authenticate方法驗證密碼是否正確
    # has_secure_password方法是rails內建的，DB設計上密碼欄位需要使用password_digest和在model設定has_secure_password就可處理密碼加密和驗證
    if @user&.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to sign_in_users_path
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to sign_in_users_path
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to sign_in_users_path
    else
      render :sign_up
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if @user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to "/"
  end

  private

  def user_params
    if action_name == "update"
      params.require(:user).permit(:name, :email)
    else
      params.require(:user).permit(:name, :email, :password)
    end
  end
end

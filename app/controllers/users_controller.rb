class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # 登録成功時の処理
      redirect_to root_path, notice: '新規登録が完了しました。'
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation)
  end
end
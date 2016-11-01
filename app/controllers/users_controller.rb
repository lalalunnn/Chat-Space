class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params[:id])
    # user.update(userupdate_params)
    if user.update(userupdate_params)
      flash[:edit] = "ユーザー情報を保存できました"
      redirect_to root_path
    else
      flash[:alert] = "保存できませんでした"
      redirect_to edit_user_path
    end
    # redirect_to root_path
  end

  private
  def userupdate_params
    params.require(:user).permit(:nickname, :email)
  end

end

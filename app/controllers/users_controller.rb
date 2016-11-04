class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def edit
  end

  def update
    if @user.update(update_params)
      flash[:edit] = 'ユーザー情報を保存できました'
      redirect_to root_url
    else
      flash[:alert] = '保存できませんでした'
      redirect_to edit_user_path
    end
  end

  private
    def update_params
      params.require(:user).permit(:nickname, :email)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def correct_user
      unless user_signed_in? && current_user == @user
        redirect_to root_url, alert: "不正な処理がされました"
      end
    end
  end

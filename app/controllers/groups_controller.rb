class GroupsController < ApplicationController
before_action :authenticate_user!

  def index
    @groups = current_user.groups
  end

  def show
    @groups = current_user.groups
    @group = Group.find(params[:id])
    @messages = @group.messages.includes(:user)
    @message = Message.new
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(create_params)

    if @group.save
      redirect_to root_url, notice: 'グループの作成に成功しました。'
    else
      render :new ,alert: 'グループの作成に失敗しました。'
    end
  end

  def edit
    @group = Group.find(params[:id])
    @members = @group.users

  end

  def update
    @group = Group.find(params[:id])
    if @group.update(update_params)
      flash[:edit] = 'グループ情報を保存できました'
      redirect_to root_url
    else
      flash[:alert] = '保存できませんでした'
      redirect_to edit_group_path
    end
  end

  private
    def create_params
      params.require(:group).permit(:group_name,{user_ids: []})
    end

    def update_params
      params.require(:group).permit(:group_name,{user_ids: []})
    end

  end

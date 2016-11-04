class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
     @message = Message.new(create_params)
     # @groups = current_user.groups

    if @message.save
      redirect_to :back, notice: '投稿できました'
    else
      redirect_to :back, alert: 'メッセージを入力してください'
    end
  end

  private
    def create_params
      params.require(:message).permit(:body, :image).merge(user_id: current_user.id,group_id: params[:group_id])
    end
  end

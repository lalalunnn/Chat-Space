class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @messages = Message.all
    @message = Message.new
    @groups = current_user.groups
  end

  def create
     @message = Message.new(create_params)

    if @message.save
      redirect_to root_path
    else
      redirect_to root_path, alert: 'メッセージを入力してください'
    end
  end

  private
    def create_params
      params.require(:message).permit(:body, :image).merge(user_id: current_user.id,group_id: params[:group_id])
    end
end

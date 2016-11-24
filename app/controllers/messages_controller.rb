class MessagesController < ApplicationController
  before_action :authenticate_user!

  def create
    @message = Message.new(create_params)

    if @message.save
      respond_to do |format|
        format.json {
          render json: { body: @message.body, image: @message.image.url, nickname: @message.user.nickname, datetime: @message.created_at.strftime('%Y/%m/%d %H:%M:%S') }
        }
      end
    else
      redirect_to :back, alert: 'メッセージを入力してください'
    end

  end

  private
    def create_params
      params.require(:message).permit(:body, :image).merge(user_id: current_user.id,group_id: params[:group_id])
    end
  end

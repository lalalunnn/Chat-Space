class ChatsController < ApplicationController
  
  def index
    @messages = Message.all # messageモデル情報の全部を取得
  end

  def create
    Message.create(message_params)
    # redirect_to :action => "index"
  end

  private
  def message_params
    params.permit(:name, :image, :message[body])
  end
end

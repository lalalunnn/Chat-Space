class MessagesController < ApplicationController

  def index
    @messages = Message.all
    @message = Message.new
  end

  def create
     @message = Message.create(create_params)

    if @message.save
      redirect_to root_path
    else
      redirect_to root_path, notice: 'メッセージを入力してください'
    end
  end

  private
    def create_params
      params.permit( :image, :body)
      # params.require( :message ).permit( :image, :body)
    end
end

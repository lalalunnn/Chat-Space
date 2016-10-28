class MessagesController < ApplicationController

  def index
    @messages = Message.all
    @message = Message.new
  end

  def create
     Message.create(create_params)
     redirect_to root_path
  end

  private
    def create_params
      # Message.create( image: params[:image], body: params[:body])
      params.permit( :image, :body)
    end

end

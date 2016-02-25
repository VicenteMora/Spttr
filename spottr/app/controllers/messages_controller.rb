class MessagesController < ApplicationController
  def index
  	@messages = Message.order("created_at")
  	@message = Message.new
  end

  def show
  	@message = Message.find(params[:id])
  end

  def create
  	@message = Message.create(params[:message])
  	@message.save
  end

  def new
  	@message = Message.new
  end

  def edit

  end

  def destroy
  	@message = Message.find(params[:id])
  	@message.destroy
  end

  private

  def messanger_user
  	@user = current_user
  end

  def message_params
  		params.require(:message).permit(:body, :user_id, :match_id)
  end
end

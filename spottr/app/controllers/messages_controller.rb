class MessagesController < ApplicationController
  def index
   @match = Match.find_by(:id => params[:match_id])
     @messages = @match.messages.order("created_at")
    respond_to do |format|
     format.html { render('index')}
     format.json  { render :json => { status: 200, response: @messages}}
   end
 end

  def show
  	@message = Message.find(params[:id])
  end

  def create
    body = params[:body]
    target_match_id = params[:match_id]
    Message.create(:body => body, :match_id => target_match_id, :user_id => current_user.id)
     respond_to do |format|
     
     format.json { render :json => {status: 200, response:  "Succesfully created message for match" + target_match_id }}
   end


    # information = request.raw_post
    # data_parsed = JSON.parse(information)

   
   # end
  	# @message = Message.create(params[:message])
  	# @message.save
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

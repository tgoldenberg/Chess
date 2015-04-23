class MessagesController < ApplicationController
  respond_to :html, :js

  def index
    @conversation = Conversation.find(params[:conversation_id])
    @messages = @conversation.messages.all
  end

  def show
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.find(params[:id])
  end

  def create
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.build message_params
    @message.sender_id = current_user.id
    if @conversation.sender_id == current_user.id
      @message.recipient_id = @conversation.recipient_id
    else
      @message.recipient_id = @conversation.sender_id
    end
    @message.save
    redirect_to conversation_message_path(@conversation, @message)
    id = @message.recipient_id.to_s
    channel = 'private-conversation.' + id
    Pusher.trigger(channel, 'new_message', {message: @message.body.to_s, time: @message.created_at })
  end

  private

  def message_params
    params.require(:message).permit(:sender_id, :recipient_id, :conversation_id, :body)
  end
end

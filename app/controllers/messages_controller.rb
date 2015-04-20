class MessagesController < ApplicationController
  respond_to :html, :js
  before_action :set_message, only: [:show, :edit, :update, :destroy]

  def index
    @messages = Message.all
  end

  def show
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.find(params[:id])
  end

  def new
    @conversation = Conversation.find(params[:conversation_id])
    @message = @conversation.messages.build message_params
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
    Pusher.trigger(channel, 'new_message', {message: @message.body.to_s })
  end

  private
    def set_message
      @message = Message.find(params[:id])
    end

    def message_params
      params.require(:message).permit(:sender_id, :recipient_id, :conversation_id, :body)
    end
end

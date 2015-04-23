class ConversationsController < ApplicationController
  respond_to :html, :js

  def index
    @conversations = Conversation.all
  end

  def show
    @conversation = Conversation.find(params[:id])
    @message = @conversation.messages.build
  end

  def create
    @conversation = Conversation.new
    @conversation.sender_id = params[:sender_id]
    @conversation.recipient_id = params[:recipient_id]
    @conversation.save
  end

  private

  def conversation_params
    params.require(:conversation).permit(:sender_id, :recipient_id)
  end
end

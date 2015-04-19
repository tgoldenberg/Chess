class ConversationsController < ApplicationController
  respond_to :html, :js
  before_action :set_conversation, only: [:show, :edit, :update, :destroy]

  def index
    @conversations = Conversation.all
  end

  def show
    @conversation = Conversation.find(params[:id])
  end

  def new
    @conversation = Conversation.new conversation_params
    @conversation.save
  end

  def create
    @conversation = Conversation.new
    @conversation.sender_id = params[:sender_id]
    @conversation.recipient_id = params[:recipient_id]
    @conversation.save
  end

  private
    def set_conversation
      @conversation = Conversation.find(params[:id])
    end

    def conversation_params
      params.require(:conversation).permit(:sender_id, :recipient_id)
    end
end

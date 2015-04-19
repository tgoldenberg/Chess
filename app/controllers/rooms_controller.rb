class RoomsController < ApplicationController
  respond_to :html, :js
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @move = Move.new(:room => @room)
    @conversation = Conversation.where(:sender_id => @room.player1_id, :recipient_id => @room.player2_id).last ||
    Conversation.where(:sender_id => @room.player2_id, :recipient_id => @room.player1_id).last ||
    Conversation.create!(:sender_id => @room.player1_id, :recipient_id => @room.player2_id)
  end

  def new
    @room = Room.new room_params
    @room.save
    redirect_to @room
    id = @room.player2_id.to_s
    channel = 'private-conversation.' + id
    Pusher.trigger(channel, 'game_acceptance', {:room => @room.id })
  end

  def create
    @room = Room.new room_params
    @room.save
    redirect_to @room
    id = @room.player2_id.to_s
    channel = 'private-conversation.' + id
    Pusher.trigger(channel, 'game_acceptance', {:room => @room.id })
  end



  private
    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:player1_id, :player2_id, :invitation_id)
    end

end

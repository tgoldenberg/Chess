class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  def index
    @rooms = Room.all
  end

  def show
  end

  def new
    @room = Room.new
    @room.player1_id = current_user.id
    @invitation = Invitation.where(current_user.id == :recipient_id).order("created_at DESC").first
    @room.player2_id = @invitation.sender_id
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

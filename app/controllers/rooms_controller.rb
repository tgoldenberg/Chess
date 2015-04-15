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
    @room.save
    redirect_to @room
  end


  private
    def set_room
      @room = Room.find(params[:id])
    end

    def room_params
      params.require(:room).permit(:player1_id, :player2_id, :invitation_id)
    end
end

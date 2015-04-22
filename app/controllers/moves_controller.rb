class MovesController < ApplicationController
  respond_to :html, :js
  before_action :set_move, only: [:show, :edit, :update, :destroy]

  def index
    @moves = Move.all
  end

  def show
    @room = Room.find(params[:room_id])
    @move = @room.moves.find(params[:id])
  end

  def new
    @room = Room.find(params[:room_id])
    @move = @room.moves.build
  end



  def create
    @room = Room.find(params[:room_id])
    @move = @room.moves.build move_params
    @move.user_id = current_user.id
    @move.save
    redirect_to room_move_path(@room, @move)
    if @room.player1_id == current_user.id
      id = @room.player2_id.to_s
    elsif @room.player2_id == current_user.id
      id = @room.player1_id.to_s
    end
    channel = 'private-conversation.' + id
    Pusher.trigger(channel, 'new_move', {user: @move.user_id, room: @move.room_id, fen: @move.piece, object_notation: @move.notation})
  end

  private
    def set_move
      @move = Move.find(params[:id])
    end

    def move_params
      params.require(:move).permit(:notation, :room_id, :piece, :user_id)
    end
end

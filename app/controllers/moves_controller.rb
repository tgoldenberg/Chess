class MovesController < ApplicationController
  respond_to :html, :js

  def index
    @room = Room.find(params[:room_id])
    @moves = @room.moves.all
  end

  def show
    @room = Room.find(params[:room_id])
    @move = @room.moves.find(params[:id])
  end

  def create
    @room = Room.find(params[:room_id])
    @move = @room.moves.build move_params
    @move.user_id = current_user.id
    @move.save
    redirect_to room_move_path(@room, @move)
    # find the opponent's id for private channel
    if @room.player1_id == current_user.id
      id = @room.player2_id.to_s
    elsif @room.player2_id == current_user.id
      id = @room.player1_id.to_s
    end
    channel = 'private-conversation.' + id
    Pusher.trigger(channel, 'new_move', {user: @move.user_id, room: @move.room_id, fen: @move.piece, object_notation: @move.notation})
  end

  private

  def move_params
    params.require(:move).permit(:notation, :room_id, :piece, :user_id)
  end
end

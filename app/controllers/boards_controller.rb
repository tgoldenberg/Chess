class BoardsController < ApplicationController
  respond_to :html, :js

  def show
    @board = Board.find(params[:id])
    id = ""
    if current_user.id == @board.move.room.player1_id
      id = @board.move.room.player2_id
    else
      id = @board.move.room.player1_id
    end
    # find opponent user and id and send Pusher notification to change the board position
    channel = 'private-conversation.' + id.to_s
    Pusher.trigger(channel, 'rearrange_board', { :fen => @board.fen })
  end

  def new
    @board = Board.new
    @board.move_id = params[:move_id]
    @board.fen = params[:fen]
    @board.save
    redirect_to @board
  end

  private

    def board_params
      params.require(:board).permit(:fen, :move_id)
    end
end

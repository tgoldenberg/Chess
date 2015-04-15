class MovesController < ApplicationController
  before_action :set_move, only: [:show, :edit, :update, :destroy]

  def index
    @moves = Move.all
  end

  def show
  end

  def new
    @room = Room.find(params[:id])
    @move = @room.moves.build move_params
  end

  def create
    @room = Room.find(params[:id])
    @move = @room.moves.build move_params

    respond_to do |format|
      if @move.save
        format.html { redirect_to @move, notice: 'Move was successfully created.' }
        format.json { render :show, status: :created, location: @move }
      else
        format.html { render :new }
        format.json { render json: @move.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_move
      @move = Move.find(params[:id])
    end

    def move_params
      params.require(:move).permit(:notation, :room_id, :piece)
    end
end

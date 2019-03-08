class BoardsController < ApplicationController

  def index
    @boards = Board.all
    @board = Board.new
  end

  def new
    @board = Board.new
  end

  def show
  end

  def edit
  end

  def create
    @board = Board.new(board_params)
    if @boardmodel.save
      redirect_to boards_path
    else
      render :new
    end
  end

  def update
    @board = Board.find_by(params[:id])
    if @board.update(board_params)
      redirect_to boards_path
    else
      render :edit
    end
  end



  def destroy
    @board = Board.find_by(params[:id])
    @board.destroy
    redirect_to board_path
  end

  private
    def board_params
      params.require(:board).permit(:name)
    end
end

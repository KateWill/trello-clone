class ListsController < ApplicationController
  before_action :set_board_id, only [:show, :index, :edit, :destroy]
  before_action :set_board_id
  
  def index
    @lists = @board.lists
  end

  def show
  end

  def new
    @list = @board.lists.new
  end

  def create
    @list = @board.lists.new(list_params)
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to [@board, @list]
    else
      render :edit
    end
  end
  
  def destroy
    @list.destroy
    redirect_to board_list_path
  end

  private

  def set_list_id
    @list = List.find(params[:id])
  end

  def set_board_id
    @board = Board.find(params[:board_id])
  end

  def list_params
    params.require(:list).permit(:item)
  end

end

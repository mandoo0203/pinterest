class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :update, :edit, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]


  def index
    @boards = Board.all
  end

  def new
    @board = Board.new(user_id: current_user.id)
    @board = current_user.boards.build

  end

  def show
  end


  def create
    @board = current_user.boards.build(board_params)
    if @board.save
      redirect_to boards_path, notice: "new board was created"
    else
      render :new

    end


  end

  def update
    if @board.update(board_params)
      redirect_to boards_path, notice: "board was updated"
    else
      render :edit
    end

  end

  def edit
  end

  def destroy
    @board.destroy
    redirect_to boards_path, notice: "board was deleted"
  end

  private
  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:name)
  end

  def correct_user
      @board = current_user.boards.find_by(id: params[:id])
      redirect_to boards_path, notice: "Not authorized to edit this board" if @board.nil?
  end


end

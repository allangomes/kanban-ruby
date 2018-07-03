# BoardsController
class BoardsController < ApplicationController
  before_action :set_board, only: %i[show update destroy]

  # GET /boards
  def index
    @boards = Board.all
    render json: Resources.new(@boards)
  end

  # POST /boards
  def create
    @board = Board.create(board_params)
    if @board.valid?
      render json: @board, status: :created
    else
      render json: @board.errors
    end
  end

  # GET /boards/:id
  def show
    render json: @board
  end

  # PUT /boards/:id
  def update
    @board.update!(board_params)
    render json: @board
  end

  # DELETE /boards/:id
  def destroy
    @board.destroy
    head :no_content
  end

  private

  def board_params
    params.permit(:title, :description, :color)
  end

  def set_board
    @board = Board.find(params[:id])
  end
end

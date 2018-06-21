# frozen_string_literal: true

# Boards Controller
class BoardsController < ApplicationController
  before_action :set_board, only: %i[show update destroy]

  # GET /boards
  def index
    @boards = Board.all
    json_resources(@boards)
  end

  # POST /boards
  def create
    @board = Board.create!(board_params)
    json_resource(@board, :created)
  end

  # GET /boards/:id
  def show
    json_resource(@board)
  end

  # PUT /boards/:id
  def update
    @board.update!(board_params)
    json_resource(@board)
  end

  # DELETE /boards/:id
  def destroy
    @board.destroy
    head :no_content
  end

  private

  def board_params
    # whitelist params
    params.permit(:title, :description, :color)
  end

  def set_board
    @board = Board.find(params[:id])
  end
end

# frozen_string_literal: true

# Lists Controller
class ListsController < ApplicationController
  before_action :set_board
  before_action :set_list, only: %i[show update destroy]

  # GET /lists
  def index
    json_resources(@board.lists)
  end

  # POST /lists
  def create
    @list = List.create!(board_params)
    json_resource(@list, :created)
  end

  # GET /lists/:id
  def show
    json_resource(@list)
  end

  # PUT /lists/:id
  def update
    @list.update!(board_params)
    json_resource(@list)
  end

  # DELETE /lists/:id
  def destroy
    @list.destroy
    head :no_content
  end

  private

  def list_params
    # whitelist params
    params.permit(:title, :description, :color)
  end

  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_list
    @list = @board.lists.find_by!(id: params[:id]) if @board
  end
end

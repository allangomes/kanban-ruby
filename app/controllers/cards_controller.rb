# frozen_string_literal: true

# Cards Controller
class CardsController < ApplicationController
  before_action :set_board
  before_action :set_card, only: %i[show update destroy]

  # GET /cards
  def index
    json_resources(@board.cards)
  end

  # POST /cards
  def create
    @card = Card.create!(board_params)
    json_resource(@card, :created)
  end

  # GET /cards/:id
  def show
    json_resource(@card)
  end

  # PUT /cards/:id
  def update
    @card.update!(board_params)
    json_resource(@card)
  end

  # DELETE /cards/:id
  def destroy
    @card.destroy
    head :no_content
  end

  private

  def card_params
    # whitelist params
    params.permit(:title, :description, :color)
  end

  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_card
    @card = @board.cards.find_by!(id: params[:id]) if @board
  end
end

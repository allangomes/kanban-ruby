# Cards Controller
class CardsController < ApplicationController
  before_action :set_board
  before_action :set_card, only: %i[show update destroy]

  # GET /cards
  def index
    render json: Resources.new(@board.cards)
  end

  # POST /cards
  def create
    @card = Card.create!(card_params)
    render json: @card, status: :created
  end

  # GET /cards/:id
  def show
    render json: @card
  end

  # PUT /cards/:id
  def update
    @card.update!(card_params)
    render json: @card
  end

  # DELETE /cards/:id
  def destroy
    @card.destroy
    head :no_content
  end

  private

  def card_params
    # whitelist params
    params.permit(:title, :description, :color, :board_id, :list_id, :position)
  end

  def set_board
    @board = Board.find(params[:board_id])
  end

  def set_card
    @card = @board.cards.find_by!(id: params[:id]) if @board
  end
end

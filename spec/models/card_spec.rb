require 'rails_helper'

RSpec.describe Card, type: :model do
  context 'with position' do

    board = Board.create!(
      title: 'board'
    )

    list = List.create!(
      title: 'list',
      board_id: board.id
    )


    it 'position is setted' do
      card1 = Card.create!(
        title: 'card',
        board_id: board.id,
        list_id: list.id
      ).reload

      expect(card1.position).to eq(1)
      expect(card1.title).to eq('card')

      card2 = Card.create!(
        title: 'card 2',
        board_id: board.id,
        list_id: list.id
      ).reload

      expect(card2.position).to eq(2)
      expect(card2.title).to eq('card 2')

      card2.update!(position: 1)
      card2.reload
      expect(card2.position).to eq(1)

      card1 = card1.reload
      expect(card1.position).to eq(2)
    end
  end
end

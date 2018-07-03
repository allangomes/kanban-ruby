require 'rails_helper'

RSpec.describe CardsController, type: :request do
  context '#index' do
    it 'must return data' do
      card = create(:angra)
      get "/boards/#{card.board_id}/cards"
      expect(response.body).to include_json(
        data: [
          id: (be_kind_of Integer),
          title: (be_kind_of String)
        ]
      )
    end
  end

  context '#show' do
    it 'must return data' do
      card = create(:pink_floyd)
      get "/boards/#{card.board_id}/cards/#{card.id}"
      expect(response.body).to include_json(
        id: card.id,
        title: card.title
      )
    end
  end

  context '#create' do
    it 'must create data' do
      board = create(:board)
      list = create(:list_movies)
      card = attributes_for(:interestellar)
      expect { post "/boards/#{board.id}/cards", params: card.merge({ list_id: list.id, board_id: board.id }) }
        .to change(Card, :count).by(1)
      expect(response).to have_http_status(201)
    end
  end

  context '#update' do
    it 'must update data' do
      card = create(:interestellar)
      params = { title: 'title updated' }
      expect { patch "/boards/#{card.board_id}/cards/#{card.id}", params: params }
        .to change { Card.find(card.id).title }.from(card.title).to(params[:title])
      expect(response).to have_http_status(200)
    end
  end

  context '#delete' do
    it 'must delete data' do
      card = create(:interestellar)
      expect { delete "/boards/#{card.board_id}/cards/#{card.id}" }
        .to change(Card, :count).by(-1)
      expect(response).to have_http_status(204)
    end
  end
end

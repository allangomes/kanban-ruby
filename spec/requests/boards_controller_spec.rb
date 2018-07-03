require 'rails_helper'

RSpec.describe BoardsController, type: :request do

  context '#index' do
    it 'must return data' do
      create(:board)
      get '/boards'
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
      board = create(:board)
      get "/boards/#{board.id}"
      expect(response.body).to include_json(
        id: board.id,
        title: board.title
      )
    end
  end

  context '#create' do
    it 'must create data' do
      board = attributes_for(:board)
      expect { post '/boards', params: board }
        .to change(Board, :count).by(1)

      expect(response).to have_http_status(201)
    end
  end

  context '#update' do
    it 'must update data' do
      board = create(:board)
      params = { id: board.id, title: 'title updated' }
      expect { put "/boards/#{board.id}", params: params }
        .to change { Board.find(board.id).title }.from(board.title).to(params[:title])
      expect(response).to have_http_status(200)
    end
  end

  context '#delete' do
    it 'must delete data' do
      board = create(:board)
      expect { delete "/boards/#{board.id}" }
        .to change(Board, :count).by(-1)
      expect(response).to have_http_status(204)
    end
  end
end

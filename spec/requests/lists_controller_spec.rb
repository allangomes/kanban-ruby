require 'rails_helper'

RSpec.describe ListsController, type: :request do
  context '#index' do
    it 'must return data' do
      list = create(:list_movies)
      get "/boards/#{list.board_id}/lists"
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
      list = create(:list_bands)
      get "/boards/#{list.board_id}/lists/#{list.id}"
      expect(response.body).to include_json(
        id: list.id,
        title: list.title
      )
    end
  end

  context '#create' do
    it 'must create data' do
      board = create(:board)
      list = attributes_for(:list_movies)
      expect { post "/boards/#{board.id}/lists", params: list.merge({ board_id: board.id }) }
        .to change(List, :count).by(1)
      expect(response).to have_http_status(201)
    end
  end

  context '#update' do
    it 'must update data' do
      list = create(:list_movies)
      params = { title: 'title updated' }
      expect { patch "/boards/#{list.board_id}/lists/#{list.id}", params: params }
        .to change { List.find(list.id).title }.from(list.title).to(params[:title])
      expect(response).to have_http_status(200)
    end
  end

  context '#delete' do
    it 'must delete data' do
      list = create(:list_movies)
      expect { delete "/boards/#{list.board_id}/lists/#{list.id}" }
        .to change(List, :count).by(-1)
      expect(response).to have_http_status(204)
    end
  end
end

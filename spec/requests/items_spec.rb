require 'rails_helper'

RSpec.describe "Items API" do
    let!(:user){create(:user)}
    let!(:todo) { create(:todo, created_by: user.id) }
    let!(:items) { create_list(:item, 20, todo_id: todo.id) }
    let!(:todo_id) { todo.id }
    let!(:id) { items.first.id }
    let!(:headers) { valid_header }

    describe 'GET /todos/:todo_id/items' do
        before { get "/todos/#{todo_id}/items", params: {}, headers: headers }
        context 'when todo exists' do
            it 'returns status code 200' do
              expect(response).to have_http_status(200)
            end
      
            it 'returns all todo items' do
              expect(json.size).to eq(20)
            end
        end
    end

    describe 'DELETE /todos/:id' do
        before { delete "/todos/#{todo_id}/items/#{id}", params: {}, headers: headers }
        it 'returns status code 204' do
          expect(response).to have_http_status(204)
        end
    end














end
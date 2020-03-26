class ItemsController < ApplicationController
    before_action  :set_todo
    before_action :set_todo_item, only: [:show, :update, :destroy]
    
    def index
        json_response(@todo.items)
    end

    # https://github.com/akabiru/todos-api/blob/part-two/app/controllers/items_controller.rb

    def show
        json_response(@item)
    end

     # POST /todos/:todo_id/items
  def create
    @todo.items.create!(item_params)
    json_response(@todo, :created)
  end

  # PUT /todos/:todo_id/items/:id
  def update
    @item.update(item_params)
    head :no_content
  end

  # DELETE /todos/:todo_id/items/:id
  def destroy
    @item.destroy
    head :no_content
  end
  

    private      
    def item_params
        params.permit(:name, :done)
    end

    def set_todo
        @todo = Todo.find(params[:todo_id])
    end

    def set_todo_item
        @item = @todo.items.find_by!(id: params[:id]) if @todo
    end
end

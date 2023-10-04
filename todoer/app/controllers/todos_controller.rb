class TodosController < ApplicationController
  def index
    @todos = Todo.all
    @new_todo = Todo.new
  end

  def create
    Todo.create(todo_params)
  
    redirect_to root_path
  end

  private

  def todo_params
    params.require(:todo).permit(:title)
  end
end

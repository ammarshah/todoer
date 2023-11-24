class TodosController < ApplicationController
  def create
    todo = Todo.new(todo_params)

    respond_to do |format|
      if todo.save
        format.html { redirect_to app_path }
      else
        format.html { redirect_to app_path, alert: todo.errors.full_messages.first }
      end
    end
  end

  private

  def todo_params
    params.require(:todo).permit(:title)
  end
end

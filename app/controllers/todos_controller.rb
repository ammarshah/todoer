class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_todo, only: [:update, :destroy]

  def create
    todo = current_user.todos.new(todo_params)

    respond_to do |format|
      if todo.save
        format.html { redirect_to app_path }
      else
        format.html { redirect_to app_path, alert: todo.errors.full_messages.first }
      end
    end
  end

  def update
    respond_to do |format|
      if @todo.update(todo_params)
        format.html { redirect_to app_path }
      else
        format.html { redirect_to app_path, alert: @todo.errors.full_messages.first }
      end
    end
  end

  def destroy
    @todo.destroy

    respond_to do |format|
      format.html { redirect_to app_path }
    end
  end

  private

  def set_todo
    @todo = current_user.todos.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:title, :completed)
  end
end

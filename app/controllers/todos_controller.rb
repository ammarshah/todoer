class TodosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_todo, only: [:update, :destroy]

  def index
    if params[:internal_request].present?
      @incomplete_todos = current_user.todos.incomplete
      @completed_todos = current_user.todos.completed
    else
      redirect_to app_path
    end
  end

  def create
    @todo = current_user.todos.new(todo_params)

    respond_to do |format|
      if @todo.save
        format.turbo_stream
        format.html { redirect_to app_path }
      else
        format.html { redirect_to app_path, alert: @todo.errors.full_messages.first }
      end
    end
  end

  def update
    @todo_before_update = @todo.dup

    respond_to do |format|
      if @todo.update(todo_params)
        format.turbo_stream
        format.html { redirect_to app_path }
      else
        format.html { redirect_to app_path, alert: @todo.errors.full_messages.first }
      end
    end
  end

  def destroy
    @todo.destroy

    respond_to do |format|
      format.turbo_stream
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
